Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71E11DE4F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182491; cv=none; b=nlKwrUSGLVob4Ageqzg80/ltZbIVVOVZAxgeHLs0w9k+S9UJOyyhKL6mxtRDxiTKnGahUOxg4inz3qmoYcESB9N51TAO2mEGXpVODAoq+mWjE8w5djOmVCXmMAI/+Fi7tntEf+oAYic87HqQtoJRfQK777QnKQpty8lN+/qpOSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182491; c=relaxed/simple;
	bh=lCYqOpRyCRmbBL94jZ0F/okLuyp+HoYMn9FcyAVJKQg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sMiTXyVMgKih2XQqFeXDsr1kAFtuiMizJpOqZNZXJSUolRtsgCkqZWNOrtAnMuZwEPI3wCYmijaTsHjWdU2bnuUteDCKKRfHjIZNqc//Z25E0aEc/2qV0rVdu2P17pyYs/8/Fydm+RrEgtONY5hQsGpUYy+CUNtU3ldr7EGFuys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDJufPUO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAHG4TB9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDJufPUO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eAHG4TB9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIBuxE308482
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/afajEm2/KI//hhbHicIwN
	6hpaVSp4UQnPfah9UlhkE=; b=ZDJufPUOrGqr//Cbb/sFpN5zAbHLx8WK+f9T/j
	VrCpJ1xpNYZm213ye4gyhSPWXHe1Q7j7mZYXwD4LTEbXB70dh2Dw3TNENc1y2wWk
	EjxrgMlueaAixZGosJ8kJAqGN2SyZ5f7KN9/RTXQ8eu7sgcbzE7nqrpiGSJnO5WU
	lUbyLhCUDhM+xew1VOZ1nuCYyw0djNLdsT/yg81M+9Bx0K0aKPnQpqGN0waBA9Qc
	XGcGitJZHM0aeQvGo+aIrsROYFKFRpZrTZdKYsG7ORb5BPqhLIK6DhXDzWAOaIyz
	YNf3eQcy7I4OAiBgJOVbq/6Y/AuUUZrjXpBghxTT+5Qh9qOg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn88n99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:01:28 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9772fe08326so117356241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785182488; x=1785787288; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/afajEm2/KI//hhbHicIwN6hpaVSp4UQnPfah9UlhkE=;
        b=eAHG4TB9hn5Vw58pILXCo6naCb4gS2J0yNvsutEN26MJkwPaW6LfJF3Ndmdh9JAJm7
         AIrusSzj32JdpPDlnZMsSFBIbPtmZB4iIoYwb3/l5bey3gPWJ1C6lJUCnl5CMQcNZCY3
         glB4YS9EPTFHUQrLthU/sIGC96XL+huV2HmsHAgbhBLI8gd6VFP751hu3Kx+yLxKqxQE
         CquvbouTQUeVOzPAoaHPGyOCfS5MzAg5KZqNe9Qryn8kwmIZ19fdsAZteuwQ5yYyj7gW
         34qh8LB53puzNcv6kfNdEiey9QfZlhfbvNDjICLyb7ad16arII4U+qJThitSy9pPc3sW
         xdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182488; x=1785787288;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/afajEm2/KI//hhbHicIwN6hpaVSp4UQnPfah9UlhkE=;
        b=HKvfDil0IjA49VtKcAHYpUaEslgpWGfgTMkxiOrnymFuCNlTvfAtDPF9hxymog4Ifc
         pSpgAmk/Nh2BSNCf6kd21ex/cJRenr1j+2yjKNJOpVa8pbjE55JmIrJHeUUwuvJHr2Fs
         Z+VP++mzP+tCCjUbZs8ywwl0k7EEwGNFZ5RIJnL2AVqo17EYjOYKGagB7P6CHw73RuvF
         CaY5mVsWiofxT4+8C/vIxQh5fHmDbYiZiOGCnrjXErtdKQy4Bh4mVenveS/sKdWu5hKM
         KvXGWWHuGZ6yEszPy8OjcrDR83Cs8sFmY2ODfDdhJ7IBy8aG97UAhPfaxxWJESXuUOBY
         n9nA==
X-Forwarded-Encrypted: i=1; AHgh+Rqo6KHNF2ma4YuTLMcfmUAKvlwZhuyIBU0tVKZT9VJTqYxIsmNnoxZaaqdZXYLNGFFf7U8KyD3eZ3RbeZKq@vger.kernel.org
X-Gm-Message-State: AOJu0YypYKUQvFh0bnlbHs6QOob9LCffqtSszFQboXhlT1fEAGK58TxL
	LUHD7raNhQVWrOzYmUSSi05EvE47g8gJ/T+pNtZGaXj0pIafpyyCsxVzERlC+jsO5YPph8jgVXX
	c4//08yz0mxJDHGxqkTc7bL3Kbfnxsg5Y+wTEDGANic0l09+GLhG9sq3Y+4SMWgD6O8QX
X-Gm-Gg: AR+sD12+kKt/8cMjSJ1e+OS7THnemoI+jQHlyRMF0iQcEmbRj5+KNq1elhjv9Aoc3vE
	2VfMuTEdYSfYZI1Tgykixdm+/w88zQukWZ9SDinEVukhRaFbbwKhLtnQD9ztK55eswxgW1vPStA
	Uha6jymxLg+WXD7LNziQ9d/JNoGR+RdJ81uwgHMFeWzMLnuQt/YpjxNSJdfiSIsS7GseMS18su+
	EuXLcAqcw1rn//1F/fCtPIVSfbBXaADO662jRJTM5ZNx6XeH2qh16Tx8IfdOPFXBsilfGpKPhMv
	zsvsySmbu4RITLZ57tpxM6wGhPbPTJ6Rrn2wsc4enckVwIyJfpg9ueDYhXJSsBZbF74xyCyYswy
	F8vPKwV/6OginhwIlde0PDAA1
X-Received: by 2002:a05:6122:6849:20b0:59a:7b23:16f5 with SMTP id 71dfb90a1353d-5c33c08daf9mr73154e0c.1.1785182487702;
        Mon, 27 Jul 2026 13:01:27 -0700 (PDT)
X-Received: by 2002:a05:6122:6849:20b0:59a:7b23:16f5 with SMTP id 71dfb90a1353d-5c33c08daf9mr73125e0c.1.1785182487287;
        Mon, 27 Jul 2026 13:01:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44a91ebsm17923935e9.3.2026.07.27.13.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:01:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] irqchip: qcom: Add sane defaults and drop defconfig
Date: Mon, 27 Jul 2026 22:01:19 +0200
Message-Id: <20260727-irqchip-qcom-defaults-v2-0-466f3c407937@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0K6dkgpVogr72FY1HaQMUChA0RDu
 LsFD+DmJy95//9VMAZCFtdkFQEXYvJ9BHVKhG1M/0QgF1koqS6yUAVQGG1DA4zWd+CwNnM7MeD
 ZOKW1k1rnInaHgDW9j9179WOeHy+00z62Gw3x5MPnOF6y3fv3sWQgAV0pjStza3R+88zpOJs2a
 l0aQ1Tbtn0BeqO3YtMAAAA=
X-Change-ID: 20260727-irqchip-qcom-defaults-e4ad255d0553
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lCYqOpRyCRmbBL94jZ0F/okLuyp+HoYMn9FcyAVJKQg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZ7kSi91tXXmaGmuLimn1RrQP6SXD9bGfbPZf7
 dYp3MkI/JeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCame5EgAKCRDBN2bmhouD
 16Z/EACIy9zydkdA76dwvDgu6l1AgN0QtUpC8PTPugnJ7euAzYg67prvdIkjrzJLJj+y8CMMZ+P
 9tDdyIg6Rzuk6CRyz7V7evZ2aeLMiqqBpOJuDlKa3rEnXomnsqWhogjotiH9b5w4l7tD05TlVqa
 a9nuVpWFva2Jsrz+1zcc81kf2jNcFog61ss4viIWlVdHkpMQiLVoNpQI0304S6AapT2wrq/worb
 9lSkPxkIfXgj3vl5OE18o1WfrvLY6mAyvS1hxpqAMpjejRU876HoUC2eUw3j4D9F0brWGo5xsd6
 EZ3nSSVhiFLB7yBuqIx7V2C7bLrt7kszAG7KRXcGZcd/pxl9xEy4/5EauQAPob39Mlat1D2QCas
 s+0GvDZCl+KdqRvfHma9NNSwJ3mlyaGtt/Dy+o6uR1KT2pfnA2TEIiRsomOKktHzjOncKraahNH
 6eLIAI8KpjxqHck0g/GwtnR1tCCxGGC4+eNiSrKNyNG6//KcRavzeS8Ig5VkTnYHHzDx5q1YMVn
 rmdMgp4nJFPOnqgn17D/dzOi6Tm8H1G9gG50adtuL2G3vDiVCLcrD1hSlH99Oi/lYd4IwX/2h58
 3tW/pTuO6qXFjb9iJo1M7QcVbmtFiOlhykxNW/WLBEt2bmQoqx+KgMl3hHeNd57uK8tknmXnoFo
 XDGOpONe+WsurBw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE4MCBTYWx0ZWRfXx0l3LJtfKmM3
 nX8nniWuSQOxTE4etjpm4pB3haCMAYlRyyW8A2m3D0U49EeWJOnSzf6DGqmcKE17eyV2MsIp2d8
 qK2GxsDvb7Yu9oRgbwzxLTHbDBzITIBXiJl9dyDvwoIBdnSWOlAYq5N0x1oKdk0D/BA4Vj89ebA
 GvqGUkjhQYvfFSOtpiPnwZGylajNTWyn9x+uvFDY/0c9i7vH+PN+g9Kog4/QyTWS/tR4ar55ZPS
 SarvLGxKHtoCQBmLt/DUIiuUG6mNgqReKadTXsxcIL00X6pzPSPy8rgyNtsYVHnia1HGkzBsZ9f
 nGKR3gUy7bMAgMBGDQ6JNoY76WYCLs/9YUhskWlADsvhGeq2lpnHmrUh6vsnpjhv/1ws7vwrxek
 B8NOeHkLTfFCcfKhaQR5Mo1x2ftNc7yCUFpwJlTWXTfXiR2t/GfyFnJVrJS3LMsezJCmU92NAv5
 KRCKWDJ6HcXQSoJRGGA==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a67b918 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EMx2JUTBaIirxIikZ7oA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: REpXl_F-FaAAublJ0Sv0BgFaCBXvtdlP
X-Proofpoint-GUID: REpXl_F-FaAAublJ0Sv0BgFaCBXvtdlP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE4MCBTYWx0ZWRfX0Bh9HUSBu6P8
 AbOFnOI1aWjgecfdGCS5oj1+SwkLXJxnn6l1PL/HNxNl08r/ulsFwnKJamU4vy+JwFqkHdpZNAS
 LZoriEtB6dHYzgvM9puUKyP+04I/Qu4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270180

Merging
=======
1. First irqchip patches via irqchip.
2. defconfig next cycle via Qualcomm SoC tree.

Changes in v2:
- Do not restrict MPM to arm64.
- Enable MPM by default only on arm64, because there is no 32-bit
  upstream user.
- Link to v1: https://patch.msgid.link/20260727-irqchip-qcom-defaults-v1-0-ed80ad83ca53@oss.qualcomm.com

We should not be really asking whether to enable internal SoC drivers.
This is an obvious choice.

And if it does not seem obvious, then consider [1].

[1] https://lore.kernel.org/all/CAHk-%3Dwhigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk%2BXDssHU0A@mail.gmail.com/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      irqchip/qcom: Enable compile testing for QCOM_PDC and QCOM_MPM
      irqchip/qcom: Add defaults for desired SoC drivers
      arm64: defconfig: Drop redundant Qualcomm irqchip entries

 arch/arm64/configs/defconfig | 2 --
 drivers/irqchip/Kconfig      | 6 ++++--
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260727-irqchip-qcom-defaults-e4ad255d0553

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

