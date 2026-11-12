Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495736;
	b=FYmPcu2CStmSkCoB2MA0P3sHhsjih+LJ8gytW4HwK5N7DKoPPdJuAJt73KDK1u1J+aX2
	 bX/wtd75fsZeRBfA0yzSvcQbdsNmh+0MYdMDAKl2+KXga1AoEGKJ49rd2qLZbX2vHu4TX
	 twjQsNiWE+t55R9U5842qye+pn6ROblks//xKvUfjnr8e5U9n76H2NYB6PX08IO4zKhf+
	 7J1bMuqlfKJjcctZfbJRgDUfVvsASRPTHg/umzepODD85WJEwLGn4rBbdppd6uxasM9Ie
	 pFddXwdjOnwJDIYkof2Z4OOQ2aIyDVreIsgEMhwuahQ+zoU1rFoQtLpoqQaNm2KmNjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xWn5f0LXvPfccgqP5IckP9cPc4GfBcu0p1HOXp4x4hQ=;
	b=4Arv8D9gkJVJuCiws+Np5vAr77e1McWFSCbX6Xm9dYl4B8Jk77ypdLtljsRp/al2GyHz
	 8UhM6tsVzsvvTvLyoTrmOs16kw5qUh579yh1y/od2bgJTEjQmQwiAb38HySs2kYSgWiF4
	 Ys6x4q36MsRxg70MC0OW4BVn6kWQOA9N2KaBCofIMpWDF4yevJr+e/wGC9kX9te6cMB1R
	 4lbIn2IYdQkpqiTk4t51xzOZCr1KA0yuwbTLhK9XpF/gMjSgZDBPTgMgFQTh36kXJlHzG
	 7zt2vEH58sJ+nsS9KWVt/M3hZXflF/x5MqZNO3SEmGKmKD1Ks7Vf0gzi3n9sSdEvUQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VSBgfG3B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XXx3m1q+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5D9606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E5D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VSBgfG3B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XXx3m1q+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBYV8H441763
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xWn5f0LXvPfccgqP5IckP9
	cPc4GfBcu0p1HOXp4x4hQ=; b=VSBgfG3ByO/PT0jOgTQ73/OZt1HMy9/MF91MqT
	NAjQJBrr3b0qa5YC7EvcIPtLs5JJbFiRZ6yxPvUUqXZst9APtwQgpICTwcmv0NXy
	iRJSFW+P83x+XPz0h8szh8r4/2iG1U7K8fzvUU4skuxFt89H6fW0S/LKm+XIZvvr
	cvSzOJ25/0yPaRTrD9DrPWkGlglPSoQvmnwuCM6Brrk0OVmh2bMJqFwBi5ksFi+H
	WKtq8xq4AyB1fX9d8dBXWqgHM+aZK8yPaXaifMSoi3oUiK3mWil57viylPPGYShL
	mPYhNXOPHtVfCYw78FtMAccN3iPzs9TAYfGaXTY8GnrqfTjA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc1yv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:02:15 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e93fab204bso4216961e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794495735; x=1795100535; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xWn5f0LXvPfccgqP5IckP9cPc4GfBcu0p1HOXp4x4hQ=;
        b=XXx3m1q+NWsNUqDluY1zDk9Sl4qDqViNMn2kr0DQu2CVA1EoZMkcNMl3c4LjrFI/Hf
         YXCMWL5Xfkta65ygE6AKHWbVZDKB4NeeytIo3pA2H9ZLT+SewBDUS5Ho9aLO48JQhfo0
         Zg+Gh6FfDNglQk7oPkPVBosnwLZKDDs6uLmPBB/+qQm/+0JCctXuAGoLSlBNa4nKsU6L
         1hws8bMC2Gjdd3buuulUCMlx3OJqkv8tDveflRAd7wQ0+H8qXKAFaYjqVzS8D2Nde9fJ
         oiEdnTtmtitdgSu/M9skvn8G6f+GYMQcIwY8eKGFNGmw0bBcYsIY5eN5nc+BbB39kHnl
         KGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495735; x=1795100535;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xWn5f0LXvPfccgqP5IckP9cPc4GfBcu0p1HOXp4x4hQ=;
        b=Xx0E4IH11KIFyI+bvHD9o8OoAdTsG7u/uF2Ch04OqfSQeaf7yxfYPfh9TfG2Z5OApT
         vrNTolYGJetNSSIUqasA3lSLjoLO+U6koyv84r1p7l/1UAHpypTWLb+grzrkn7tIS0xu
         7sAsiljCqCCFPP7Bzhs/ir7kRYcY1tAyRaeTLq68+RFJQ5/YP7MlvsmTtcT8R3npUDw+
         NrpcQOmcxC+fB269VLXXHijJ4oSdEdSUy07fc55KERkEGVYLC8WDCVsYO1rut0XBNAjo
         eBcvsxqJxkn8ZC2RltC63ZiTDvfyh301H9aAjDBH8+xeCFeY++DDY/uiwW8nYqj0TGW2
         9/4A==
X-Gm-Message-State: APuU4Z/FbkhFl+V3IaZ4NXubJF84H+bwuFQAL7CraeqjlTjYIf16eJWB
	etCPhuQtmsYLI+fut5a+9yx2GqRkU38ebGGKytoFeFS+kDb+eMXRFme7Gzohtut+FwsdMxmBeYR
	kDCiYQ7sk8pRQsff4P3o6t9wWFrvBD8A/doh96z6nHuabeO5xexRE3GAhww/7dvyr8odw
X-Gm-Gg: AYBFou0T5J7QgmajgGos9XpZy6k+k+uhE1beSded5q8I0NoJIbdLYiZhO/ikGCrT5c5
	Cy5nzR/OAyHnTcArvvE9T/Efba/ZouFjSqYA5DrqEvVyxPZ/DcZwu5Lckw1sJ7CIR37EqQXYAjg
	5mlM8K2pJ5zvlfNo6zU1S7TlV4M2oWHAbIEMeN0xQBGl25TzsSMJ3APulgdKZ2d1Z8/QZH1IQ4T
	9NSgYpNKDA8lGHvaBZ17cMQBaNpYikZG/hvrDrlkj5ZkGXxVYzro+MCrG+zeBIS9vr/fJPII6BK
	YPVCKr5ZphtJuBH4ETt67EXf6wI2yBdJBja61V+NpW8cBbgIiVW8/UpOS8WFeq5XK9wjdBF1tNc
	fiCUIBfXDptSR3HAD8cUMiNz7JK9Di4MxQ/jCY7rgZ6l3omROTYmen3j36eBMtAXUZWLdyQ==
X-Received: by 2002:a05:6122:a5c7:20b0:5ee:3276:58d5 with SMTP id 71dfb90a1353d-5ee3276714emr21009e0c.5.1794495734427;
        Thu, 12 Nov 2026 07:02:14 -0800 (PST)
X-Received: by 2002:a05:6122:a5c7:20b0:5ee:3276:58d5 with SMTP id 71dfb90a1353d-5ee3276714emr20921e0c.5.1794495733786;
        Thu, 12 Nov 2026 07:02:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e354b0sm106758475e9.1.2026.11.12.07.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:02:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm: qcom: display/msm: Require DSI graph endpoint
Date: Thu, 12 Nov 2026 16:02:01 +0100
Message-Id: <20261112-display-msm-of-graph-v3-0-7fd0c06ec6df@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNzQ6CMBAGX8X0bEm3VH48+R7GQ6Et1ADFLhAJ4
 d0tePGg8bLJJN/OLAS1txrJ+bAQryeL1nUB4uOBlLXsKk2tCkw44wkAMKos9o2caYstdYZWXvY
 1lSwDeSoTEIUg4bX32tjnrr3e3oxjcdflsLm2RW1xcH7euxNsuz+JCSijzMTAEpNBWoiLQ4weo
 2xK17ZROGQrTfzTBT9cPLiMMplReWpErr641nV9AT0FVxgdAQAA
X-Change-ID: 20261110-display-msm-of-graph-a081a5c614b4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3605;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a5k21sPjS0DUr/NbolvO9G7hioG0EUTtUwzEZTG6XNo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9dTs5tNTAu964+ctTeD9UFyfijhDnNW+6OLsA
 OAGmozIQkaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavXU7AAKCRDBN2bmhouD
 16xvD/9Yv0mSIUagFwLapTjq3aTkxOjE6xtjL2EMVjynsMVBf9ar5yIAEdRzEaSpHUkgDHVLcGv
 nUYzLhgZYbQqytvV9chGw0i0//kvdB6KwABtuRLWMKQ8pLu42Zt43BMWMZxiNXFhxpPV0g/Ap6n
 r/HG7H7F2/vRT7oHap10fIGXGK7TXHZY8Dlm3jwh+PWVpVkGJlt4nnqTHYFugb1N5JKU/D8vrW5
 vU+QCR0pmqhKaYaBN0ZZP8ICx8EWWHLNhMYoA6ypLH5ZPFGaLf4c4D+ulyyd2HSS/HyvTmfwBjG
 SCzXjbksFGnLH5W+58s9IN9T+4eYfqQSYUeOYhfBqXd0G4BgypO/PhKK4lvUETpRzWRUf3Cp34b
 PoanxrLmyfzQUCANNbvnlfPWpeAO3ws2YhdK7bUjb7UaKuNnDggH/jZZFAkmnAvXJlpuHEOjhX8
 kl/jxHckV2/M+ggJrF9cNCHGQjRXJoWEEEs0dNTVbP5+K9fUBNLNL+hltT2TUnJPrSGF+jS7C6M
 z3wu7xSh50f4DGxKew1cMSc3L4IuEGYOq8jqNMDJNlz3RzbbU1zHfbzCCVUSRmU5KGW5Ft3WSJ7
 Hgg6CRoBB5bXAtPV/NU8WIisEmz7IovjU3sdDoULK/0ihJVhM78ztO5wFt1P7ICt8onrUJrK6vR
 Ntp43P+bMY5EPAw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 43QLflAusDWDNyxzsQ-OCtpPz6esz5XA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfX5+S1zawoZ3Wg
 6+xY8CLqYYye0XrmLyhAvK2RJeIBXD67cqpWf7uBepBwzw6GnZl5LbdGR82ytf+uKTMJB2Hn/az
 mgoc8DbA5ju+MhWyPq6XCJweWfigoPs=
X-Proofpoint-GUID: 43QLflAusDWDNyxzsQ-OCtpPz6esz5XA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfX+CvLobSucPcI
 ai/EMk1kfWycn4GqMI9itTu3fYDOAC8gG4ZmzMQar+dLppqBNUTVtjRZyYZZRIIr74Mx8p/Ci5V
 CIlyUinnCexsdlBw+MMgpDiN2ojEpGPsSX84CmNXXRAeYH422TGrEEK0Pxf1IRguhi3QJr+dqFf
 +bzNMcZiPaz3j9BycXygXHn8kYQovgnrD83v74VuRp+1ffry23COjQV+JyKtLp2siQm6NgtujNH
 egG5ORxzY1rhYW6+BzRWLtvRS79t/+q8Ou1h96TZU8q9qUnIrIIWnjaVopG6kIGMuYwS9S0VR20
 OsM52GPWdtseUBPaM5v77IKAWdBGLl3XaYsE9XpRk+HAi8f+0QKQmF/dcGHedyO0EpbKiHJVw2A
 soakXiKEH4It8wZzu2B/c3CL6SO9yz+7a2fMRTPY8bZZG0lQEzZDzm5BjDxNP7FExrLLcn8Q4KP
 auabGbVdQZDp9KsetVg==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5d4f7 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_iFXmH2w7s5zJ4zlvgEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120059

The DTS can be applied as is. Then the bindings can go independently.

Changes in v3:
- Add missing mdss_dsi0 to apq8016 (patch #1)
- Adjust commit msg (no probe failure) of patch #2
- Link to v2: https://patch.msgid.link/20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com

Changes in v2:
- Patch #1: Update also apq8016
- Link to v1: https://patch.msgid.link/20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com

Qualcomm DSI display drivers won't work without proper endpoint, so be
explicit about this in the bindings, so we can validate the DTS
properly.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: msm8916: Disable disconnected DSI
      arm64: dts: qcom: msm8996-oneplus: Disable disconnected DSI
      dt-bindings: display/msm: Require DSI graph endpoint

 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
 .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
 .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
 .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts                          | 8 ++++++++
 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts             | 8 ++++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts              | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts                | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts                 | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts            | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                             | 4 ++++
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi              | 2 --
 33 files changed, 92 insertions(+), 5 deletions(-)
---
base-commit: 27b8d2cd13f68ac75f737a6f471a7247d2beea6b
change-id: 20261110-display-msm-of-graph-a081a5c614b4

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

