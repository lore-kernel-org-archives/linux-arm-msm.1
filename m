Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794630511;
	b=zYTE51Jx17mTCYnlDEktGD5naT/dM+ULg/TFtqmk830dBzu0wEYUQ5QvM5ds+libAt+b
	 SW6rn5wi3p870GEmMSbYrkwoH8Wc8y1wAOy46XjngEByiMTVsGHTDZVzR2vii8Wdq/KhF
	 hkHwJwkCZBtiYnE0w/RJRZ/EcebuSF7+frgzHXTjCNULR/epwU5pc0Xuecs8+MrffrZXs
	 /v86tulzLLfeO2fO8ZI2O/VL7BbiVfEmng7VfQY0ZY3cYFcZ7yoQWMItNeuZwnTR5A+dB
	 M1Aa55rSkHET7ckpTHk/2Nx3mwZdlFqohMvxT+6y6smJYIs+lqEOb65TGiySSIoEtSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794630511;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZSzz+5aAEcXLQdb2itEe1a2h18bypa80aF21lhD+PR8=;
	b=GE+lhPFgqz0fRt6XHMncfLHpIS1OH76iLnqEGMyrYAGaZQjXYfhIDm4Dl2PteykL8395
	 0FigOgrUeFcYyVcBpzpTzJKLDSjkwH7j07MNGzhJ7/ecA+95pOtxwxWMSAQuHsVglbsww
	 Xqo5gd3MYFMKe22NugMb3Ta+JtDaKDqEZ3EM1s/u87aPL3k6SRAF4cXyR32X699vFVfWj
	 Wn/+gBwl6YHh6XoaaP4F1YbP/Tw+tskJY8J6440mcKz8VZmA9zNn8MIXEt35gLphBOxF/
	 5ARHmCQ3A9ag/ZpBhjt+nvHQ8CZI2AGTEF+chEwmeRJcKtKae5bzMssLjJISa57GL8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pa90DZxi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dhnAbi8t;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBDB606A330
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 04:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EBDB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pa90DZxi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dhnAbi8t
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE201ZY1038836
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 04:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZSzz+5aAEcXLQdb2itEe1a
	2h18bypa80aF21lhD+PR8=; b=Pa90DZximbUntMHC944rpFIUC8hg05bSCAwuT3
	4Tja2GR+ttMZDa82j/3+BGa0R4KuKS4sV9t+y77w06hK+4M14ygD/QYr74gI/1Ad
	rl9SW8bZ/eX6vBgL15+HbGsc3EyRBuUE+7HFbWNIsam0LWKDeh2d756RMic45hyz
	9Y7Xnd1zds9lPt7Sbur9Jq02mRM4etjRy/xfqZvSXO/4OUZSlABb9HFyHBLvEfk8
	MOz9XqZFeeB7D/Abx8VsPPVvIOZL1+sMUv/C+8rmQ6r0jHpq7cxvPmiemE8Tae8e
	CvCkad7vWXIRzFoBSvtqiCo6yC9gYO060c0xAOo1gUtZMnhQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx6maa18y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 04:28:30 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-702a3e438dbso1972682eaf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 20:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794630509; x=1795235309; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZSzz+5aAEcXLQdb2itEe1a2h18bypa80aF21lhD+PR8=;
        b=dhnAbi8t1J0w2Xh/IX6r3kFm1j/0fpJq+Krvxb7wAEiVbmAAMkq8U1aH1T89m49kSY
         aw4S65U1vjcEReboyL0fu8KThshVT6pUxDCRqJ+XnP6o5v3nAN1QYCteS9UF+imweEIM
         8i2DpM3JiMW0QLdC0YPMRy6KD7MBHm0WDDfU0bA9JasH8cp03uz/RwcCrZmbqU6kVsxY
         inFQKybb/Tc1WRa8vZts1fCw2UZJuKAVtFHqpnbwE9jRPDuMvq9UG3roPHmwUbdgchqL
         eFjEIe7C3Lbt49uR0tXvu3Khg0iIT03JbGnix5TCCxcpoyOXx1NK9cFpLzvmdyyQORbZ
         gm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794630509; x=1795235309;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZSzz+5aAEcXLQdb2itEe1a2h18bypa80aF21lhD+PR8=;
        b=gi+SLINiZAAlx1iKGLknZTmEUnIbfFx6UrH2drmKCUS/3+WEppHkd+PtmUjJhLEArh
         N21ziFZyEfkCN9hHkmBh9Yxm5WNoLGXfzwGBwSMnEepr//ObQ4f/iShuhxjoXdg1PZ0Y
         nvgEaq3jvw9zllvQ4L5zUzLaqU4JZROsK6MSHzU/t6BO32mCO+4MStpFnWnKoaMKZNIf
         zJvofoOnIyldcO91c4n1ak819MWWD2HRysPaSk2McU3d3fK07u/SHFe3p4l5IJZ4z3Z7
         HpvAXgab7yGKPfeuWfYaluqa4r+Nn9s+io8nqAF3gTZbUVCvWqmxIAZdrKmH1GdFeWvE
         QwMA==
X-Gm-Message-State: APuU4Z8qFXCdWh7hps3uuR455whF+BIf3cIy7rA39ZoJaAuVSnipajmr
	HqwzYfHkdaj4bRmqr1tGo2WPdiVkJu1c5sHXoUrgb5/vtBKYQ6+XtDILIzbT7QommSR7ys7AlUb
	Gfvpp3w9DKiwcw58kKq2Y5jCaiUdU4C5xFFT0e40upjV4ycJ8STm6AXc9WwfabnCZEXEW
X-Gm-Gg: AYBFou0WWMVtGchyZpU0p7qmQl7/HnUbEoojTfgmj4gxG0co49Q+IIdtCVFBge58LX4
	peTFc/4v275FyHwM69AgUYTKw0TNKEfK3f6K2oD6QZwr3J1Jzl6x20jDC0LLF2hjsPpR3FY9MPr
	HkILy+4+y81auyGgQhYzrSAZUycue+2p+UnrhhkLiAweLaXh7hBOUBZgj6dEDXkVZ8gYI3u1Fv5
	jR6GqYbfx4Xr0yCl6u+VtdIzmotWvMCY763BMVNgH2f9/iMo1Kuld/IDX5htLvXTEpQQwGpa8SV
	zqwokJRueQP0d9+vSmQfs5u6bgOJxXmzvgWFoUwlujKBFHGJ9ga5gGTQd3z4y6QU4DIJXJiatpN
	A5gq2Kh+W8fUOGdDH4/gZzRVLCyEwG/H9De6BAMo8wo2gUraDwXIdiGh0i+6AVhN2ge8=
X-Received: by 2002:a05:6820:a088:b0:703:4766:16e with SMTP id 006d021491bc7-71ab51394aemr2703705eaf.56.1794630509492;
        Fri, 13 Nov 2026 20:28:29 -0800 (PST)
X-Received: by 2002:a05:6820:a088:b0:703:4766:16e with SMTP id 006d021491bc7-71ab51394aemr2703693eaf.56.1794630509016;
        Fri, 13 Nov 2026 20:28:29 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab3f44dc4sm3292269eaf.0.2026.11.13.20.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:28:28 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
Date: Fri, 13 Nov 2026 22:28:24 -0600
Message-Id: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nj3cI8QwNdI0tDC8PEZENDEwtDJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tAM9Nwd9oAAAA
X-Change-ID: 20261113-qn10-29181ac11481
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=l4U55GauqfKYmjZblc8qA/udLK0JxGMWA36CD3J//LI=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq9+NrWSVFdd/JjIwGhxYvFn43p2RAcFulnfnE/
 MQLXTcJj3yJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavfjaxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUlbxAApG15epwb4gxWI+lZWZQGR32mhPoa4nWMHR+h/Dj
 VxlDYo81C/dHmQQzRtylEBS+cBXSnM9FVD+kFZN2kqP2Pj7urkYlB61A+0v49FFLajevWudB3Mt
 OLWkNaoJuPoq3YlxWfGNDSdtX6wKKDettZJwGlCLQ2cT3rPmVGV01xnaHHEqw/S2vzWaW5B6umE
 grRS8UxPQWuSnmshCUHGkB9YEMno0eAoYScPZr052I3h9EDYwMt7WSf7CfBrXmpCh2UvI1di+Vz
 3t3ReHCZ9EeywpidU7EOwOvDu9A2JRKHBqc47cDahJFoe1jldVOSW1VOAgoCqPjSzZ0dZ2Jp4IF
 Ipj7X7i+bz/Vv3HyuTjjFLVvvvzz0GTbnbiAbKTI9aT65zHyjaAymNAO7pq2FMsGuoxFT8ebo8X
 bvSSUh3eAPEJSmR3Fgul8KoWl0ag5AT+GoyUpupsrl7NTDoBVMy+zKamrUIA9ZUTwI5Y2/qjarf
 zh+fAuXYDG2ASVKHaAq8rJ/8EwIpaA9UNpXUftiv8uCZ23ZftcvVWdi032BDsT5n9OqYmvKvUh4
 UA7UoIqlw8LlGCXWhY+3ACwl50KGfZ1IAWzW71QRMqR/f3QFAeN1WET+6bPQqhVIWcOI6hFBjoJ
 1DHt3FFK7y/UrqdLOhMYonn/3uTvx52HiJ/WFIMQQcKQ=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: m2xsKwgO12SPF6yqwHnoPZrmq22BKMe4
X-Authority-Analysis: v=2.4 cv=RbcFmFtv c=1 sm=1 tr=0 ts=6af7e36e cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Emmm5F2WQI_e9zkRZ9EA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX8xLjEujxQa8d
 SzSasvKBaBvzcMahMr71P5sJCT5LzcwdpS2hv5NuK70kwGaAOMYadxRYbf/mNW2puw1ClHvGe56
 OHU2YH/mln+qdKlZIicezkeFFRW2ZQC1y597oGFX3bmH2nHezaOXOowu360dAHyxS3ykD47rY1Q
 djQS/kit7yGGiLOmZof1bHF9DKYmZD2PENZMf8h/pSZmzBMtI62BsYgvfJ0ZdAvL3w7eGAtMO/j
 vCRze9D0aa2AYN3F3aPaCSsBsqtqvFVoGYlT1H6HAt5bG1iSr6fxdxlGzr2GfJltw5ZNxt5JMI2
 ceCSAVda10o+gLjAE6X2DSeSPK/a38+eTMfdslfEZmAuFZSV4eVvcooOPXQmwpU99hejdtselRL
 t1S8E+CaqHJZcc20zvo1HASD4MKHznhyEUUcQr97K4n0sZ4RC3Q+JNH3sO6fL9sQttRxvFnhrpV
 w/M56TnPXAn+Xndq10A==
X-Proofpoint-ORIG-GUID: m2xsKwgO12SPF6yqwHnoPZrmq22BKMe4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX33hZDEYeuOAe
 jRqIogaSI2zI1IvBHO8hv2rRNf8T2Tl0KKTn3HPIju8zLZ1WvbaIPTk+YV8yD++ilEj3msFXx0L
 bWUV6FW1xWoxkFyEKAq5Aeka7qubd5c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140017

Introduce the ASUS Ascent QN10 compact desktop computer.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (3):
      dt-bindings: arm: qcom: Add ASUS Ascent QN10
      arm64: dts: qcom: glymur: Add ASUS Ascent QN10
      firmware: qcom: Allow QSEECOM on ASUS Ascent QN10

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/glymur-asus-ascent-qn10.dts      | 670 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 4 files changed, 673 insertions(+)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261113-qn10-29181ac11481

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

