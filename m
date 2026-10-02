Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50194028E2
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930859; cv=none; b=rGNWDOof8WXD9FS8U9oogWcjKLCvppSMhCOcIuUp6BEjS99nKDZu/TMrMbvqvwAnuldRmrwfCroNPGNpIp/NsmOhO4ii3BVc0L0FzzrMEL9EjrRoqj/TxKqnMc8bNEe4OC4LV4WVRSI7xeLdQbt0Ip+ss4Jk9EQOIrpMGFMB55I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930859; c=relaxed/simple;
	bh=CfVVsEKQiKUKIdQcsrMCIp1srl6qWTN/O3a/DTTNycc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tB8qRjus6Il3cSPTYCUOGLEAjCvoBmTSqQ79NIjMDw9VE/529vGNRqbfN25dmfRgyVjfznMaivgm58bPBVBiTzkiUrhbInq4DsSdiLRz/UamdN7fLiPkXw1T4l0zJY6cv+02Z+tPp/yWOAhErScQji0lb5D5/0lIdZAvn4/JZRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKQZ18ZI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKQZ18ZI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCBF1F0089F
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 08:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790930850;
	bh=CfVVsEKQiKUKIdQcsrMCIp1srl6qWTN/O3a/DTTNycc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=iKQZ18ZIyT/fVEtc72YDH/BHrYxahKwYj5Nv/ogMFYNMWwydRxf+bEJo0eAIlouLz
	 vv+AHCWcroFzoGrDwNdvmcrbzBWRYlZ4O1J+kEPxlwMaLW7hrKauTn6H+FNkhPaPcq
	 pj6Fpgk1IjY5UggfTXjvLK4vVpZFXoi8NerZU45PA4CbQlnM/gWkdqwxi/NIL0ZH4v
	 BJlZLYmsxbHML7QZHOHXEmjHrx7hcEpauRz6gvNKTXuXRYTgLM2n558pL5NA+QkQ5Z
	 na1N5MhNIhvEdUO0OQNlP8WVKGR5BBdiPVNf6Szl0sdoJ1HIPTxvcJDYR3oPDMYD/x
	 35SAKJDoNsszA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5bb79ea1170so1154372e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 01:47:29 -0700 (PDT)
X-Gm-Message-State: AFq9FYLewmE1YXzVzBFUhjrMpFMAqtvUTYgC4y1UJj2p/W0+HGDgu4n8
	LO9T/HTKXwrr7YSo0i3GSCYxYfbFIBidDUUnVR0YX66MsjAHeYCAF9b/a5cwfHoKI+ljo7zB7Ne
	Lfpyf/VUVRI+sBcvbciKy731+4z9pKX42YFE5oYq9ZA==
X-Received: by 2002:ac2:4301:0:b0:5b8:ea1f:1212 with SMTP id
 2adb3069b0e04-5bb9bb034cdmr497464e87.29.1790930848716; Fri, 02 Oct 2026
 01:47:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 11:47:26 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 11:47:26 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260917-nord-usb-dwc3-dt-v2-1-8f88aa30c434@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-nord-usb-dwc3-dt-v2-1-8f88aa30c434@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:47:26 +0300
X-Gmail-Original-Message-ID: <CAMRc=Mf=Uw549oV0sAdkEKn0YWGbGs3WJDvwT9QT68Wof_M1jw@mail.gmail.com>
X-Gm-Features: AclHuK9ZnIv7V1GnuyGLwFWZPuYOe9gSpC1LVPzxGkpqRg2LumFl06AulgiqkeU
Message-ID: <CAMRc=Mf=Uw549oV0sAdkEKn0YWGbGs3WJDvwT9QT68Wof_M1jw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Document the Nord
 DWC3 controller
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sep 2026 19:07:00 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> Add a compatible for the DWC3 USB controller found on the Qualcomm Nord
> SoC.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20260901103300.60803-1-shengchao.guo@oss.qualcomm.com
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix the interrupt constraints for Nord: we also require hs_phy_irq
> - Link to v1: https://lore.kernel.org/all/20260901103300.60803-1-shengchao.guo@oss.qualcomm.com/
> ---

Greg: could you please queue this for v7.4?

Thanks,
Bartosz
