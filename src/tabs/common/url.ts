import { Tab, getCurrentTab } from '../tabs'
import { Language, getCurrentLanguage } from './language'

export const getLanguageFromUrl = (): Language => {
  const url = new URL(window.location.href)
  var urlLanguage = null

  Object.keys(Language).filter(language => {
    if (url.searchParams.get(Language[language]) !== null) urlLanguage = Language[language]
  })

  return urlLanguage
}

export const getTabFromUrl = (): Tab => {
  const url = new URL(window.location.href)
  var urlTab = null;

  Object.keys(Tab).filter(tab => {
    if (url.searchParams.get(Tab[tab]) !== null) urlTab = Tab[tab]
  })

  return urlTab
}

export const getHashFromUrl = (): string => {
  const url = new URL(window.location.href)

  if (url.hash) return url.hash.substr(1)

  return null
}

export const updateUrl = (): URL => {
  const url = new URL(window.location.href)
  url.search = '?' + getCurrentLanguage() + '&' + getCurrentTab()

  // Modify history stack only if not a back-button-case
  if (window.location.href != url.toString()) {
    history.pushState({}, document.title, url)
  }

  return url
}
