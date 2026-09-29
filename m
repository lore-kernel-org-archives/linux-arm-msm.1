Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDE5511E73
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677900; cv=none; b=jOxrQNgYCHXEwFfCQ7eOR4k15y+x+u9FjuGD/zVymJJ0oBv5osdTe31mRT8r0HSGBa4kfvZ8Lqt7A1NzYjvpEYc8Ylkew9Od2yXBULtwm8BjuMHYe4wEMNZFN8rSuhfi6I7X+erUY7FzceNGpYy2YnpK+GZITVt4FgCCpUqQ6kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677900; c=relaxed/simple;
	bh=6Zboq4cT2y84yPYufagiEkEzfccik/iBkOyKlp5pXB4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b3dtucewuXkJUL3m/D+wK2xg0mVtxJaNSIi2Nk203V/R+yQ3tvh7axAI1Kep27ircyuq2hjHfs5UC0ognkr/H3SvYiEYQac5y/yOuVVZgqczEUP5/qCExekvxbYuzdBvFGadesQJHmzxTFBOJ+4sAz4XumMRLaLvkjvxf4pljy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5Acq4uM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zc90gcJT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5Acq4uM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zc90gcJT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T8XRgp1004678
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WuBWHHToL3K7RwYQNdbWwY
	+nhIh7kIQTyJPyvxEIHhA=; b=m5Acq4uMj1KHvZGkR8kFXaqrqXg7eo5p+fte+8
	6bI3G8o59cXGUWCQbTxg+aDnohwSY4tmAn9d1OicbSt+WAnkrBbgwcQ0L4WKmMWl
	MZHtUgkzcnCGLU+6rXCjXHh73bOFMhvVQI4dyWYgjLwTb/69wiil12lhy6Q8y5lx
	AqSV8Ab+8NvF0ienmgXObOSnd3a4nESS/C3JGnNdBYETtwUd3U02ubx++wwpfQNN
	9EITar2pmZoSFDiyzeI4/cQN2AWFapG6O3lO/AYVxqTdAFCW5zu95nmLK7sCoEKv
	ZXURuvgP8YcnMrUeUtwOuZNlcvWgfojKhk6khDxew+VFmTQQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4rfbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:31:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso3389223a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790677888; x=1791282688; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WuBWHHToL3K7RwYQNdbWwY+nhIh7kIQTyJPyvxEIHhA=;
        b=Zc90gcJTr+n2grhAgnSrl6tRcVFI2tvsi9YxpFUsIuIxlmNhj+uFrM59aghW6rt6Qs
         QzGAQRMBhr6ikJD2PIUkqWq3X4e1Su77/HByuIaYJebiLtvaWZfowcPRQFVyXeN+ssaf
         Lbbl0K8VQ6wIhT5OMCBu6foY7vJxJRgYmw/ogpkd+j5inCDpMZRR7Pk2NcXrY15cAVsu
         ew2AmdvcldCef5i9oC03r3P6VkqWJVxulx5gIFOdFcrDL5F837BF7/Hhl9jK3ROiEqkW
         jxo3QIL5dL8FDI1MFSYDjTItAtLUIMrntFwwzgRM71aIiB6YMTIiKWxObFMJDD+0xj9E
         ULhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677888; x=1791282688;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WuBWHHToL3K7RwYQNdbWwY+nhIh7kIQTyJPyvxEIHhA=;
        b=flOJ7XVVp1u1CFi1ByFv4Fb2sO90D3FIku/A/FGe7MxCCVAEJDQ+bqXUGe2SLcLfQ/
         2EJj3yOiKQhNPwTT4lQ3q5KanPlwOAjPHT0bB/aERILLWTDwQLBDN+0m05UKMk/v7rd+
         2iuQr8e4Yk/Umd5m+9GyHC0KlKnRmNLWppvAIm/6JLXZH+CVyCv8pTVuoPbvVhGV3CNE
         c+MG2aFMYbwYBxxzgRdwDtSfys4DiZ3VGGc6XQnZ7kq5UdFOf2SXb9SBlSr7QwSuXcOJ
         yqmplWBpw6lva+rt7OulNPjZSfNo0wztyy8glZH2QMYgmJqVIL8AwCB3Tq1j0hdRyu/A
         mwYg==
X-Gm-Message-State: AFq9FYKq77Zwx0uAtP4NpkHYQ3qhqFJ0T9aLsOeAwk65waT6Y38Ucfs8
	S+h/UQmVSII8ksudJxQzkGyKnqVl7QxGCpJfm888qwamjeAHhVicXJB3ohzkoF8qqB7lSx9YXUb
	fCBnu2zEbEUV+bTqE6oJfQshH4bXaEeUa1qQZRkiws2u2oeNesjjQK+nBennMi4C/VOBqqOEZob
	k9
X-Gm-Gg: AYBFou2leozVuOp7aCmRO0vdJ5F/O4//WufxXqyr9RFzRaDh+TEsYRCfORyeXM5PTHZ
	yjmg9g0ONpMpvmnKQbDeQCDJPs9WbtuvEYfLysjCtZgBqO6rqgapMlPHtjpJbfogFfob1OkkoDG
	ploR+RJyQIs5q5Sd1S/O8+8iv6VQzBnCS6tyxoKDNYt3/LbwUSz2T+du2S4W56Q6il2ocH5PbH1
	9No9xpTA04lJLe5kUGeC9KcIkyfEpODwzAUq6obh7R9D1KJnYYIvkx+PBMY3LISwI/9c0qVVck5
	XJwzid1mtxF/9UIFsX0jj85/+4oE6ShSvKLj81R9SvcdmAxiC/8Wis+RDMfYqSdcx7a8nN1jtJY
	DRWYz/65uEFbOPQ==
X-Received: by 2002:a17:90b:3a46:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a2b04e8389mr3606747a91.44.1790677888298;
        Tue, 29 Sep 2026 03:31:28 -0700 (PDT)
X-Received: by 2002:a17:90b:3a46:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a2b04e8389mr3606726a91.44.1790677887783;
        Tue, 29 Sep 2026 03:31:27 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492dfc5absm2470791a91.3.2026.09.29.03.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:27 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: sm8750: Add watchdog support
Date: Tue, 29 Sep 2026 16:01:20 +0530
Message-Id: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHiTu2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNL3eJcC3NTA93yxJLkjJT8dN00MzOzJINUE2OgsBJQV0FRalpmBdj
 E6NjaWgCZ41eJYQAAAA==
X-Change-ID: 20260929-sm8750-watchdog-f666b0e43875
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790677883; l=657;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=6Zboq4cT2y84yPYufagiEkEzfccik/iBkOyKlp5pXB4=;
 b=CPxKRN+SRfNGx9D8zFn3yOCXAefiaCsFOITRfQoELYm+zrFRlpYM708iTDnB/u05hlu2Zp4NH
 +QD+Ex9wD1cAbsdeUrZBZgR5keXDWzrflDLpn0XQFjQ1qVdj5G06pvp
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX7N89Nwb717NN
 HK60UC0veJFjl3b1Zgufr+uwHiglObkhOcP+vBCThicVHM8Wgxp3LICptKTecfxupcpIhds07L0
 baxnce1em0fqW1cWCN95n89wfUU9qpw=
X-Proofpoint-GUID: djQH6A-sLZE--eH6Bgr42SRI6oeMq6XH
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abb9381 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gH04VMV99jTEonyKTDQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: djQH6A-sLZE--eH6Bgr42SRI6oeMq6XH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX0/u7OzYObwJx
 9qSIKqXdLHPxitdi3QYKWl2YnEDYStVUy53jeg38rfq5wKVDPYj5a4P6liyaBy/PW22/6mPpp20
 u/vWTkGGnC+YKbKLvQNnmJNaAWv+HzY8Zric2SQpSqcQDmzndWrpWi+9N6mDpDG40q4Tg/9yM8p
 dJm89qv6szIvjBeYlSrOvLn//vG9T8ur0ksHDwjEwkVcp9Wm03PpmJI5K2aPw4qGFQPpz044lJF
 HgqRYdQq1h8Ty+THpYed/7RK1D6huUgdfBHXRI2461GnpkAGlVRm7Tfkh2cNJ5pF+olvBPbZ01B
 8FohuhLNFcMs8OhJ+niP+voQHWJN/1UUlhdkhJKTxaAgDcPe+ZTN++ug+yVBcV99CZhssCvlWnP
 Y+J22QrBzxk3xtWYZFsSSgsR2lW1U0zLrYiWeHF6t5u64y1gm+PGhV+9q/ZBSh2s+3yKeD5/Dct
 TTK7smZv7kqWIzLCvgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290041

This series adds Qualcomm SM8750 watchdog support by updating both the
binding and the SM8750 devicetree.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Komal Bajaj (2):
      dt-bindings: watchdog: qcom-wdt: Document SM8750 watchdog
      arm64: dts: qcom: sm8750: Add watchdog node

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi                     | 7 +++++++
 2 files changed, 8 insertions(+)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260929-sm8750-watchdog-f666b0e43875

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

