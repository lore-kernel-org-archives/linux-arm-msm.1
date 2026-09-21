Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936464A43E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001274; cv=none; b=NHRujENhdVBWlUXCROdWjeKNlI8WwwZVkJI1G1zsrRnsEoD+bdKKnNBflP1rrElrNOLV2tl2z6/k+FTL/6g54IfM7jcfTj1qlinrGzhwy2ieG7OHBxVWw+32+S5rtS8zP72dO0jtFpR3HlFTdvooMH5xTi0wTtUgdC43aKjTSdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001274; c=relaxed/simple;
	bh=AlTk06HzLBHHE5X5apCoXfFR9gCpau/oSF99eQyifQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVZ5n2HC8EKd9EQ02IAxAEC/HiyD4ahXnX7oxGI95N+217EUfPTU1hzHmM6IjvEKt6SJfNOLXwaPLHqB5CFq7bHFvhcStm6u/8Ko1En43OUFfwP74l11795/xduvfF+pVsz4OcTshPvnPRA6Zdn6gssQyqE7X9l0Dyw40PxgNdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L6e5liBR; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L6e5liBR"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17452so2451160e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790001270; x=1790606070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=up7la13N5P698qqLdVjKevYqSqg9Pb2eoFO9uiD7Mlg=;
        b=L6e5liBRzfBqHSNGv6D1i60GAFVwSUQRRj54f9UEmBWeUH77BT8wA8TVNOM3O+cHS0
         5fWUV6kGbInG+5eG0LhnWKqFpCHsruO+eFm46mVh2JUnjRfCJ0rBOgTmhJuYO0sV/73q
         iZ2jYCvDQUmlO2e3dfNS/e+dxCfCxI9nUbk38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001270; x=1790606070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=up7la13N5P698qqLdVjKevYqSqg9Pb2eoFO9uiD7Mlg=;
        b=bEmLWAWTWzb2i4H8ZSlpBR/dTWbg82GNHzOh0tPBZC303jl+a7gyeVswnxSQJ0E9k1
         cHezB8gEH+Rv0Zf2KLkV0uXPRthRFrKJwvYCkmSF36ji0wNbI2b3Uisi0lHKJ9k0DOt4
         0O4Un1kO99AWzpLx0thWppoqPpVlTB6Y/BdgnIYTg2Lw5WkdrQ/raoLKrYdax4JEIGdu
         NPeYcWG2Aj5hiixuTDrug26NVQpacgFRZXqfknvUrzJF9+z8O8mV6RuwYqbNGyTr39Ct
         3fJcY47mnwP3NNoFiOz6ZQ4fexpX55+0XX3H92bryqVqxhGjEk7uQM4hzV+khIAVnwwd
         ApCg==
X-Forwarded-Encrypted: i=1; AKwUvBzWYNjVBJ7OlpdH925xD+nZDz2tecR4uuWzmApPebgcO+Z9IGN+m+Jn2i46Gg7j3VsQTshrGnm3fOoxbsug@vger.kernel.org
X-Gm-Message-State: AFuF++kVKBo9CETChPFvgPWSJ+E28/4jVA1QfUs2ulEa5OOsFC0DT4iw
	YQm8XMY+5fwXNFv9/IUE/BIbE6f9MRiJ4HGCpq7mFDkJdyFtByy9YZygX0NQUsbEIJqwtktzH4T
	lIrc0iQ==
X-Gm-Gg: AYBFou3IOyUnU1EzFe9PF0t3sOUHdNPsBVcY0z/+pVWlu9Cphq5aUKwCrAdaVtHnl/B
	KQpzb2gUjrSZog9C61NuiNi+JifjVWuiLPd43j4ePAKqGkAw0ebws13HPiKl00bKGptgmg9+uss
	qWKtZ+KSD9tHdh9hB4mVTDfKxUqPb2+Ii/D6ie+3hC62UzE4FyOU17LPzyInGSHhhMYnHH58L0F
	9wGWglQfD528/ZQl/QjgqxoZu9pEoMHyzCoOCFkV8Z+qfobNMHc5IKhazuscEpHjq8oWnoDXmRZ
	CVxyt2CY4pfy7rL7VFLTLAgzXFu6TsATx9d3JItX4yGZ5lmCP1VIuhmPRSuvZGO5Q67L28F7W+T
	O3vGK/m7i4bksOJD7Hq33kOn7trWlXPGxCNm8Mv379vSPAzBQnMjOP1fUny7KcBgGBnIYzzKdZP
	hm6swvs9PJ3haXKZNzKXc24EsYku7dZ07v2Rx2Hu40EUc4XMhrQCQqPDrJ7Osdsl0zNT1xN7y2E
	WGiQciD4gCgTNOWKBC0FWMxjqRK+pBdlODuuqw=
X-Received: by 2002:a05:6512:3046:b0:5b6:183c:5ca2 with SMTP id 2adb3069b0e04-5b8c195c05emr3865382e87.64.1790001270420;
        Mon, 21 Sep 2026 07:34:30 -0700 (PDT)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com. [74.125.229.204])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c78c13besm2055384e87.11.2026.09.21.07.34.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 07:34:28 -0700 (PDT)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so2647565e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:34:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzK5Gd8tVyKQf34ppGl5NEjv4KWYjmnO82GRz2F4ej76B6mdmqV8Sg/Y9pORNgncO1ZzUTobRXzhEBrTQdU@vger.kernel.org
X-Received: by 2002:a05:6512:33c6:b0:5b6:177f:b86e with SMTP id
 2adb3069b0e04-5b8c18055camr3271431e87.19.1790001266246; Mon, 21 Sep 2026
 07:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com> <20260918120515.595782-3-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260918120515.595782-3-srinivas.kandagatla@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Sep 2026 07:34:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1wkKjXi06HDKtmCZfBSF-mrUphFSUHZHz182Lv55GGw@mail.gmail.com>
X-Gm-Features: AcwNN1XkYY9zKiJQugffglLcLBvktTTAOkyuKYc5ncbh4pswEfbFSP6yXWFImyw
Message-ID: <CAD=FV=V1wkKjXi06HDKtmCZfBSF-mrUphFSUHZHz182Lv55GGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/panel-edp: add CSOT MNE007QB1-1 entry
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 18, 2026 at 5:05=E2=80=AFAM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> 14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
> The panel identifies as CSW 0x1465 over eDP AUX and is not in
> edp_panels[] today, so probe falls back to conservative timings.
>
> EDID, read over the panel's DP AUX DDC bus:
>
>   00 ff ff ff ff ff ff 00 0e 77 65 14 00 00 00 00
>   00 23 01 04 a5 1e 13 78 07 37 3a a3 55 4d 9c 25
>   0c 50 55 00 00 00 01 01 01 01 01 01 01 01 01 01
>   01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
>   66 00 2d bc 10 00 00 18 00 00 00 fd 00 1e 3c 4a
>   4a 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
>   53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fc
>   00 4d 4e 45 30 30 37 51 42 31 2d 31 0a 20 01 6a
>
>   70 20 79 02 00 20 00 0c 40 8b f6 65 14 00 00 00
>   00 00 19 00 21 00 1d c8 0b 5d 07 80 07 b0 04 00
>   3d 7a 54 cc 94 99 66 52 0f 02 35 54 00 80 00 80
>   00 80 12 78 26 00 09 02 00 00 00 00 00 01 00 00
>   22 00 14 0f 5a 02 05 7f 07 9f 00 2f 00 1f 00 af
>   04 22 00 05 00 05 00 81 00 15 74 1a 00 00 03 51
>   1e 3c 00 00 00 00 00 00 3c 00 00 00 00 8d 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 90
>
>   Manufacturer: CSW
>   Model: 0x1465
>   Made in: 2025
>   Display Product Name: 'MNE007QB1-1'
>   ASCII String: 'CSOT T3'
>   DTD 1: 1920x1200 60.006199 Hz 16:10 (302 mm x 189 mm)
>
> Datasheet was not available, so timings are not datasheet-derived.
> The delay_200_500_e50 preset matches the sibling CSOT MNE007QB/QS
> entries already in the file.
>
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Pushed to drm-misc-next:

[2/3] drm/panel-edp: add CSOT MNE007QB1-1 entry
      commit: 8a43738e56d9eb76a573cabab4c9c0e73eab23b2
