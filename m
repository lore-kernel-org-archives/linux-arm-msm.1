Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E483E639D
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897116; cv=none; b=jHp+kddL4/MdVI3eyvUSJPFRLXxsjaKci5uOxGfOFFktFJzBn/IDqXbRhNfkZhTmIax3SUQm6kLp0Anha5T7lcbmCaicJj8grvIEXTFWi1bRYvBIsKwGbmES70GBHj/cr4KqRp9X4TPgNkqUhuuEhyi/OJiOhplxV4z0wOnBgDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897116; c=relaxed/simple;
	bh=znPdOFOwZBUMCj5EAY5o5FOSIiA+E9Kvc8jNsKVmGTI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ooTjgjf4p/yjvpU7kl708ZEHPIWAR+wkaRSPcsTQQ1QX++aRAi8n3zHHOzhYAJeUo0bmKdAoZPIwfp/3IBtqMyBEy6RW68s3afi77lSQyqbugyr/Rb7qoE92WABGNkBygV3iwS8uUP23QQPV2Wsn8RZ+ZSsJJja/r7zXRla+MBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXFwhIGN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VhxZfhG1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXFwhIGN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VhxZfhG1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8V0T5922844
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q6rsWUbniNR+35DRdgW8wR
	wITWrJkhIyDXQjUBXS89w=; b=lXFwhIGNcyWrnKksud6+Yifza6NwoUkRKZqPgR
	/yJG9ugFb2EDYcjsW0RRj1i1ZbD0N+KfnJBOsLx3h4780I3ym/towluelNcewv/k
	07cdDcZd4pWDdnaqmsTTl+ZlPqWdfJfFATitUqxL25Zf/d8jdgrc09H+dGbChtr0
	ZjlD/Mv+JTT3/7cYrTHKVt4/ekR8b8DaxW30o0AFgO0GqqttZ6Ge+qAAFWyV47+d
	5Us2GmUF3s549N1Yrg6oYE88K1AovcvR/sOLAkS6ixleNQyv/2H0uBbcK2s8J1Xm
	+s4Pfi2e7gXEVjlnE0wc0240KQ96DQzw6t2sFHKNuORmu1+A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1u352-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:11:54 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so372081137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791897114; x=1792501914; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q6rsWUbniNR+35DRdgW8wRwITWrJkhIyDXQjUBXS89w=;
        b=VhxZfhG1y5lnfWcI7mwwq9AvwDutWxlx6PzRkBUxC9GxivCRDZvZWQKvLkYbTbQu8V
         sgb7+tNfekHMmBcpx9LObUVYRhnT/HtKdFauIpD+yU7XzE5fdPUgzbwSoLd7klY1Yylc
         17370tI3X7vyLurA8Dbk2Rn46xBOkQn7bmj2ZB226GDyztn+Gvd1BHEFLbHNJhtitC5e
         eGmsQgbwoNePIWUC3v0YTcMk9uU3K9DTBO4W1NU3MnZ4V0bTUK1MAAOtuDihlIvMSP6R
         aSq+0b63qttbcCDf0EilIzcFAYICvK+BGax/JeohSm4/CAarHwX1lbL1RU8k5zBz7YA0
         LfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897114; x=1792501914;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q6rsWUbniNR+35DRdgW8wRwITWrJkhIyDXQjUBXS89w=;
        b=SctiMmIhxLgVfUis7uSnRjxRJiAnaMxP8hpsMIZqEivgI65kQPvkVPO8jvvPbZTgPx
         4pOXeH9QhSZVuIV3GDId/BR+cKf1ZVOIgU+iyHr4hd7Ue9TCsQCO+MoJQyr3E70tNNtF
         2sMVXWcIDOFuFWQhocoDXAiVOrQ3+uwR43eChS035Isvd+VT0if78dRhqfcMDt54gN85
         dMMG1JlO+0/7HTWCICEJcjacrlZeBVQlCXMKnE4qp25xnNcH2582tCEbaCaAQygFSI2u
         3ct32/sRlFWvllTQNVBvkm3Ki8gOTMp/lFA81ge0TIhDfrwXVSV4Uy2Q6aGnHk57qNZo
         8ahA==
X-Gm-Message-State: AFq9FYK7XM2Knsn5su3QCmVmpiqnSaBDCuyIPa7+gFZUjgDPZJ4YeCVl
	1iHb4o4r5HZ/0OdxSwWPltqgbX7VkWqkUWS1hrYrhGPymmm0HPLjVz1Gl1vfKy5ipDXfmfMXW0p
	uQb9oeGRBhfM1ZZtGFhBNJVfhp+ib2G/YUCFlSmGTyewotn6v70pX59KYAXOyHMWpubKL
X-Gm-Gg: AYBFou1z/O3srHgi8YWPVp+uV8gxiLt/S9k4QcYT34Q/zyH6IDVUSfMMHRfxo+DtFjD
	3Ey8fSivXQb0onvzror3O9Sq6OaoA7d/FzpkTjObKbvv72yKkEfhBpEJ9iI4NGrvmFh8k66QZU7
	LYJywHswgaad3vNnNs3xrWLcXpfiD/BahI2jkuSJnAUjs3hxGOtsWFWwO3I+7UYxVgzhB4JEBri
	4qGt75ostuYKGvXWldggrhTLHFy/9aZzgJc41X1t8sGpwHlb4nTTDMSDWn6IAY1tU35nsjMy8bz
	MHknIgdmo0bIGt6raRmE6SL1qL/HdiSiBfo/wuKBauDPRO/yy8fKtcJJjzVOK1VONSMVmP22+kx
	QrjrnFdgND/GaGMCXBREv4AerwOqs
X-Received: by 2002:a05:6102:2926:b0:7a1:f980:e934 with SMTP id ada2fe7eead31-7cb372b60b9mr2953264137.16.1791897113544;
        Tue, 13 Oct 2026 06:11:53 -0700 (PDT)
X-Received: by 2002:a05:6102:2926:b0:7a1:f980:e934 with SMTP id ada2fe7eead31-7cb372b60b9mr2953253137.16.1791897112868;
        Tue, 13 Oct 2026 06:11:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm371862945e9.15.2026.10.13.06.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:11:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/4] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Tue, 13 Oct 2026 15:11:43 +0200
Message-Id: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA8uzmoC/43NwQ6CMAyA4VchOzuyDhjgyfcwHgYrsAgMN5kaw
 rs7OHgyxkuTv0m/LsSh1ejIMVqIRa+dNmOI5BCRupNji1Sr0IQzLljJS9pO2lDXSYuKNo/RKKS
 9Mdd5olgI0UisskohCfeTxUY/d/t8Cd1pdzf2tb/ysG3/UT1QRrNcZWkBoBDkyTgX32bZ12YY4
 jDIhnv+AYEx+AXyAJYyZaKAHJK6/gKu6/oG9ksB8hoBAAA=
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=znPdOFOwZBUMCj5EAY5o5FOSIiA+E9Kvc8jNsKVmGTI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzi4RXrdsC65I4MjBMM8tUmtxLP2yFKhw57Z0X
 ubdJjjS/R6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4uEQAKCRAFnS7L/zaE
 w8GID/433Qh79G6boT6tYRR1lO0R1CnFBlp5Dl4whYb4Cf3YF27rilpZhkXIKafBZrBL6SDJfII
 uOgRPUmF0GOF0kh5eaB90XRDmu5vaaB/IINYPkQhas0mb4UfNesmgHCJSicWPgtn9CLeoGmQkki
 Iadg4RiBYKkD1ehaJpNdixHtBh36U+Xm+hyHVAPdXRHcia7+RCGAJmCNzLIPo4xHdnDHvTI+LlN
 EN13MUm5miKU+TIW2FMI+RkPgOhty+hmP6MRVKeq5Z4MUJhPklqch5ece+PrBmzrzjHLPZh+r65
 VmaOAeLPx0EGj4QjfGcrBP8HkSwfBgkaiqSH8xmcuBzcIAa0JY+2jYtnaG9b9h35HwIFrpK5oNX
 /pH1d0sxlzrlvIORXqQvkmOXBI76L9XEZoF3Vzcw4gxazXceRJaHP2nF7Y9NdAD4OgfTOqAvyU4
 tOwBZT4tiXdXKOFDlTg5B/1glPcjpcLd1JKcF+xg4EddwBZhNXkkE8uoiXf6/J1olFznVzlxCCo
 azvrYSnYg09wwiMM57FllabsbS9E3098IkYh3YeUi6gYxLjWDKoAHT15q2YlC8CVo3xCIoeU92Q
 Wi/fAPnWHlegacL7WDDGgSkMUazcfJHohPZs1mUevko6MkojXsxRA6vKAKds7wk+edFq7cGpP0q
 u5umYYfKWHZ2sOQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace2e1a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=cYHgvgXoKsdrWYhR6y0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: mCA1xKPO4RgCD_JaxhE014oQlC0UmxkC
X-Proofpoint-ORIG-GUID: mCA1xKPO4RgCD_JaxhE014oQlC0UmxkC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX40leIQMA07vI
 il1cz9kA865JcNCS0SMuwWDkmIblz/H5aAG3kjqVvO45rdNKgX2PvmWA1GW2Z9UuzHie2ifoEa4
 yt3rNjqCkG1Tf34Km3NETQtO+xqzsu4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfXxDTDB6pwX2bX
 jCC5Vl+SmSNgMxTxbL1UqxmIdgbcOXItg8TgaA0mMOBly5rx3Kn2ZVOkbMY3EXmjI8RXqMIlCp+
 cm9ZFKXxS7J9YoLCuPicskG8jpAefs7sQcdjy3rOWDyfQRmXA3Co6rwDyqcZbNO0NGyP9pPvuUx
 Bp20qiRpMiF2vZkp5PiqME82tYDPj6qHDYkD0d4s381bmkTf7MX6dFtp2Li+yepP+p8PSZzxDxB
 weHoASHM+4CWP6Idv1M9HJSEYn4MpPtIPkfBHfw4bYLVg+a3ajsd2LqYHPPGtZaqekw/hA8Y/79
 GK73SPq74h4jqEOd/qqC61EhTCWqEwipIkGpJHMmU9f/CD6I3oc5Dto45gPd3QaiSAURlY3uWII
 ZVJtnmg6JRw7feubOG7yx+cxEwTqE5daR/VkAjKBF8B+WLjzjYE+kr9ZFgcLfAO/ZjPAkkk1dQ7
 ufrNmcW6PHB5ybSVVcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130052

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. In fact: we trigger a NULL-pointer deference.

Making it work requires a more serious rework. This is what patch 4/4
does with 3/4 introducing a preparatory improvement.

The second patch fixes the NULL-pointer dereference in favor of
gracefully returning an error. The first patch fixes another problem the
clanker found during review.

Tested that the issue no longer happens and that fwnode-based sharing of
GPIOs  works on Qualcomm Eliza.

Patches 1-2 should go into v7.3 and stable. Patches 3-4 are v7.4
material.

Sashiko pointed out two more issues under v2 but they're false positives.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Move struct auxiliary_device out of struct gpio_shared_ref
- Link to v2: https://patch.msgid.link/20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com

Changes in v2:
- Rework the shared GPIO management to replace platform lookup with
  software nodes associated with proxy GPIO controllers
- Link to v1: https://patch.msgid.link/20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      gpio: shared: fix use-after-free bug when adding shared proxies
      gpio: shared: gracefully handle no-device lookup of shared GPIOs
      gpio: shared: detach the proxy device from struct gpio_shared_ref
      gpio: shared: convert to using software nodes for GPIO shared proxy lookup

 drivers/gpio/gpiolib-shared.c | 154 ++++++++++++++++++++++--------------------
 drivers/gpio/gpiolib-shared.h |  15 ++--
 drivers/gpio/gpiolib.c        |  20 +-----
 3 files changed, 90 insertions(+), 99 deletions(-)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

