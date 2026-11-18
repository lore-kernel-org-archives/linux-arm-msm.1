Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972847;
	b=c81Z9ZBu4xat5+E0T+vrGN5hi4r/a7k8ww1HdZzX1MA/7BQkTbmLRJ9ydNDwdTVIGky6
	 MvtDxUYgyr+q/95wp4Bm+UUngEvIayX/UNWCkP2RdlJPvnpr8xoWV5yfJppuMr377hdA+
	 DTICXgDAanB1nibjrUngO39xN8NqG7JB83SmLKuP4pEyMystLaghao3LO98w2q0810nHw
	 f++sepDj3TJtzVFrlylyyZI10YT6OJENYsLJvG65L7shgx3nCW4OeTo0Iuo+tSGAk+VA1
	 +Jua0jx15uEg/FuIktctDPCyYIfYAXReSBk/+FtZ9vZ7g2u0eicgOMM/3NgA6hc/DFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=be+nfB5khQE6/SF/DDupLZk9C5kHEWpvXOGk/ycQcC8=;
	b=lbuu+YJ6TICEl092W6+Z3nCk07R+IkZszP1GXRXO4FAJxdRsg0R2KmQX6dw1Q+f612tN
	 JQRmr0+7pzCdVDdMd4znY4kmIaMYn0GCWh+hoicjsgfEmKHgUo2rXHQg1ZFQoImQjWGws
	 HNq+HIhmDaAQfpkEDwlzw4rRGsV9kNIO5iHukElBdtqNp6gKdcwKPPrQ8AFhy1A4cguLC
	 T0N0yYU/uZ1rOqRFMEIWBbeEkU9J7gQPr++qW9Zsh5LPPgdl9LMy8XD2kve89xcc80Vqs
	 +OkclBK7y3O++Cr4LOse2OHknYbhqpm5q4G3kxmttW8++39jXKJBeLOz86BcvCnVu4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DqQkyOmY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVEsRgv1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9376A606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9376A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DqQkyOmY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVEsRgv1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V24w472672
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=be+nfB5khQE6/SF/DDupLZ
	k9C5kHEWpvXOGk/ycQcC8=; b=DqQkyOmYM/06TucRwGs9OSTVa9rkZh72T0nw/O
	ScbWotpqhba8Sd/k98VmzBQ/Wy9Mw2NyWW3V7eeCUNcLDTvPPJJu8M4Xa7stYnPw
	qeJxJz0ADOFPPAUkO0XOXsLoffIVJCwcscTpMhDOobV0YQ7lEX6SRb9b9rrB1qLA
	d7gV2uaE1nF9Hw673ynjK2VnjxOiQKLJGITgtfoBS6Fx16BlmcmjlaHoF7zdRt5L
	2G9XrbSzKGe+11hWFT+iS9VJf+UOU9CSTZbMqFXrM2Pn1uIVD/RcsD115QWPQr6J
	t8tH+9pDsl6SoL+9P5LOyyRGlRe34MDS+NQHG+p1Lmlrt3tQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv88yc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:34:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b69d1f2a18so343076b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 19:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794972844; x=1795577644; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=be+nfB5khQE6/SF/DDupLZk9C5kHEWpvXOGk/ycQcC8=;
        b=bVEsRgv1PMPytjc+pj97UPs5L5gjtPKyeqz4Ed+kqhgazcO9fxcioe5yR7NFz7UxQu
         +nnHinR1cWAyzCOGNKZLvX6TN/rxx7DrMahF2EUDvgaOmFd716fMxG/vT0BU22Ijnzcb
         Gt/BNEvREM+LFrd9a/kWwa/k7yl1gxntFCqAD+GL8uf/l57GPykmSZ2iTwLRtv0tFrMb
         +pTtmCicrl4H5eeYAdXbgn/8LMJzxBBMzIpuMLkP9dPd3xPAkc9YzUVyifPxkT9ljyKH
         /mqqFutk8hPXWIfCWDKNR2wLI9FIMFawqoFDy9AyKBUkarBt5UvjYaoe8UR+jkMNMWjJ
         35lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972844; x=1795577644;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=be+nfB5khQE6/SF/DDupLZk9C5kHEWpvXOGk/ycQcC8=;
        b=0z4wovPz9PpN5N+MdqC4/7z1TCIQp1ZdCmkMlTpLNcenb2u55hNuAzgnKkoOMJ4QtG
         nxMPNAaJH0hXP90wrXa9hFFtfJA9gvfnEDvcVo+olpTa5UNcZWOzen98AzNUwFV7oaRZ
         7GOF/pePavgaEpFErMsS1TriZsZkY/d9Zz4CbYmV6RvNhs8GjfZoCH7SL5Ee5CvF8tpS
         GViFS3W3ycT6A3EZvT32qnnZMms+vjn1o9cqBwCB77SoEiOt3ZxKVRvLP6MlmFcXNz7D
         nggfJ8nykqpIjTc7FpORtCXqRX8lmoifjKFlY++nIkn2aqeDK8TB6o2RFaplUjFoto5s
         O+ew==
X-Gm-Message-State: APuU4Z9vKdwcuqfua0untk5V6a2Zc/UD8x0O6R8NyhhqSg3MPAwZoAZp
	haFF9/A8Oo0t9huWlYKJo61bOJQekXneOj0Ar05DlQB106lg7V1SCeGBgW4SYYir/Seb5TPQ9Ac
	hQm2p9uX+xsyv4HhmssdNHz3E2D1/lMgq6iXzZIl9VL81Pd6ObqFSPTvKiddBf5FnHBik
X-Gm-Gg: AYBFou1qzGW/9OtGh7Zn/XSNh74aecULG4zpxFkV5AjfKv7kzpbC64fE4M5Csra29Ta
	HX/QJkeA3sRtqv1YZ5d8HVpAgYVDCK8e4D9q/aNCZzDd9VgMDgRd9QEg6Nw42UP42beOgQw1j+e
	na7iiSkIi+CFgp8RINEOPKDW+hhoAclgB1bEujKGxrSKcaH1GJ94wVolf/GVPc+AszwlD6kF+K9
	hl/yO8GHS/llqB8te7HZ1BOi/zYJo6pr/j9V0BcgvWITkIUDF93xiPR8tHba2ckd76sW+d5Hrw6
	631B60oDwg0pQ7RWm3yrQsZI9tmNGAApicD7M1EG5D+CiuYOzSrR1CEhifjMzpO0+lGjLmVU2+F
	HRybVjPMqCkITAROmNz3Bk2dCm8DQVCBu5NIrF3WmYO2dnLzHVtsAHIH1uaAtnRS4pIzYGMY6vo
	eOWbjSAgU9yCFBv82K83HIIYZpw+rFIBwXoWdx7S40fg==
X-Received: by 2002:a05:6a00:ac89:b0:8b5:fbd0:cb49 with SMTP id d2e1a72fcca58-8c4566c8716mr3247349b3a.21.1794972844002;
        Tue, 17 Nov 2026 19:34:04 -0800 (PST)
X-Received: by 2002:a05:6a00:ac89:b0:8b5:fbd0:cb49 with SMTP id d2e1a72fcca58-8c4566c8716mr3247339b3a.21.1794972843553;
        Tue, 17 Nov 2026 19:34:03 -0800 (PST)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c5327088sm431644b3a.0.2026.11.17.19.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:34:03 -0800 (PST)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Enable WCN7850 on Maili MTP
Date: Wed, 18 Nov 2026 11:33:12 +0800
Message-Id: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHkc/WoC/zWO0Q6CMAxFf4Xs2SWwQUF/xfDQjU5mZOg2lITw7
 w7Qx9Pent6FBfKWArtkC/P0tsGOLkFxypju0d2I2y4xE7mAIheSfx7ouIq8EgYJlJaNQZbST0/
 Gzrvp2h4cJnUnHbfzLaEwEFcene630V+Ugp5egTuaI9/fFEX9M6bFlCrFQ3sY9DgMNl6yWhtl6
 rMG0CCpyWvCshKoTF6VQGCgg0ZKBNau6xdux2Kw5wAAAA==
X-Change-ID: 20261023-wlan-bt-52fae6bc38fa
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794972840; l=724;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=R9AtMwTL9Vvm5vUIfktqvmwQq6sgOwn2uhqAMW302Fg=;
 b=hpLO0dh2Dpl1vjcjXW3xry0vWqRKE048m5ZUSJ0mVkcmQM/iGitLq4uBN3zCo/KtDlzrCYq3m
 AEhlJ+rx6A6CuQBMqQUrGL9/i2sHJsfDOHKeJhNZIyXiB929X75GXN1
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: 6bS0J_auR7Ygu-6-6vDgjc_k7EYb2F6S
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd1cad cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hXh6KkJ9KS8hL0CtB4cA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX4qEIfD5mEgeg
 kRkB4O0xQIvyDgZagsChaytsuBT/qBdF81bocX8kRKl4ULM/N/Mtnmnftb4tlsIW3w7cjjWTjSw
 WaoH4lQr0GF2cYaNgO0mcqlJx8kaGGaLnK96hlj+WmrDCWDLMcXMOGIo8L43AiaiFCzkDFUAthV
 /7WUZetNW3+bygqO6+1ytYcs7ThXzkVajmwTT+AHWEjGDqtuoBT6afUJDnpwxjfy+756Fn/BQUn
 YfYb19kvgycKgvVgu4GovdzpfRZdm5E/eL7i15zOJ+AFZaZLfy+g4grwyaSJdeCMo36762oVJ1T
 UnMtlJ0L4NA29C7t5CgjPmoPK1+yawYKBuvVsmu3F/ekAp1TrNWxAKIm18bYdNBihmMa6VDUpKX
 5g9K5sPZVPWnMK6mUlcemPMk1lZq7Ec/GfkUWvEbcBOChgE2YPOLnBFyR78oXNzlZNGRTSacX7x
 D5n8Um7Xfoo8Fo+vPwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX2oaACej4IrJ1
 FYAYyDclZTA9jzm0ONHHZ3YMBGJba/WWfdriUrO2yCG6PVX8sfnL6s9BCKL2uKZl0YGyGQHZcvu
 k2THp0C+1NoNwpBlDfOzYXBIK1SVS0Q=
X-Proofpoint-GUID: 6bS0J_auR7Ygu-6-6vDgjc_k7EYb2F6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180013

Enable WLAN and Bluetooth support for the WCN7850 on the Maili MTP
reworked with the Hamilton module.

Patch 1 describes the shared PMU and PCIe WLAN function. Patch 2 adds
the Bluetooth enable resources and UART connection.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Yijie Yang (2):
      arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN support
      arm64: dts: qcom: maili-mtp: Add WCN7850 Bluetooth support

 arch/arm64/boot/dts/qcom/maili-mtp.dts | 121 +++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261023-wlan-bt-52fae6bc38fa

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>

