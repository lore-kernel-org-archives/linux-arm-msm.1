Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101806;
	b=1C15ViTq08u1DZH680VKUwRACUDX05jOKdWyzRkHOnB6NGnNtqXpxQN0mjW38m6RjO14
	 thZWY58v8sxi6MuMEY9O0s/cSs5egDGFJcYRrKGdu/Hn0ZQAzxjwJbFcWjleH26Ts6Z03
	 Z95v/WYg5aoE4xu3MMTp6rA1DHKoM6GnaoNSENXDLa+O3fAlTOlyB3Cdwx9GnXd2KlwiP
	 TnRogOkg/QYOj4l6bCnZt5KhDd5zFzOhFY1T/6CmejALSYabAMumLmZIThGl11DDCJXPN
	 zWwu23+n4rqfIFC2UvyN1HcP94dY0JYfVZDU++gQicR1afO6p7nIWUOMcQtoVBObtDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zIjrZgR7dp+EH7DmWZ9zl/0I86QLRtWJ52RJzKOEy+8=;
	b=ghg/9bg4Swj6eOLjs2w7buAB0npTDfHzmdMeLAMiUTOR1z/l+UJXetPVz48EjTtx/f1z
	 PYWC+XxntjNjWvkw1NyCkXUmeBi0ThveKOL3EWqReFAlPbnXJrM3gVyi99uWSVf0PpdTa
	 uPU1s0UPMOcGUBg/I3G/JG+GmMoLw060EG+JDfrfB3sVUrDQUd4YmWc2A3YTLcvqiPHfj
	 rNFevQ4HZxWFUr7dXQyr1PmKI9N8PWxDZTK1e6Cnq3ECVyTRLWpgoR3WXZgPNnmKUK8hl
	 jZ8SoAp+fedMqWu9+Jhdj9LplupZqGKE5X+Z5NX/ZZGQ0cVVYfquPTmjAz/U4sYAIuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOZCGZxN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HepyyvFZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E3F606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E3F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOZCGZxN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HepyyvFZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsmC1973260
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zIjrZgR7dp+EH7DmWZ9zl/0I86QLRtWJ52R
	JzKOEy+8=; b=GOZCGZxNGVkU9lZgDezE1pEQgUEGBimtTwmG/4y5B/BnRaXQMke
	I4RDEtnpt+Akb57O49mMO5Tx+v71FpqNDy314mWqaGrpkFH9kUu0U0EciWOGEHxh
	5qBPi/IN/0+UAz8j8IzfFFZ4CRNJCFwvOOV9bxOoCvyhwQfjHNG53t+0GmLUilFb
	pqzkx2k6UnGJukrbzVlSZ12rqAXyByeJXUMBbuYkKVOVnJf7UYG37gk6MKGyfhop
	FVdWn0T91xw4ZYFDNIkuypOxKs4yKTEmG47Na9OtmM9MNiELK5B6G56w+YVbAn0r
	fe0lQgLYbW+qKUcyMjqAH2qOjrtA5gAvSHQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gcry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:50:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so6981692eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101805; x=1793706605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIjrZgR7dp+EH7DmWZ9zl/0I86QLRtWJ52RJzKOEy+8=;
        b=HepyyvFZzNrlUQmNZ3kXMsSlXgrMnwNGft5UYhas9CUJojJ3agOkHU9hk2YK+nulu7
         D/i4Lx+KnVW3dIdssoUHQ+BaMYEygsgROfN7rK5NrNkLRH6GbQpl/HgMsHOuDh3Rdy/J
         97lh8ERV1YG5D3LLQnYqM/CJitOhvYBg0If8T5uXaFN3NlbHeCY2xSFNKt3lZCrhOfcf
         Sy5SYEoEI8pkRcJ806sh/ym23vmbY1qIQCBXs5VOw3LrD3NKsO5TZE7RBqTL2feqX77K
         sbRAacgQ0mF2jeopTvSEEqwyI4xmFtwjMeTeaWPEhasl//AaEr1RYbu09UpR2cOaRWEF
         +xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101805; x=1793706605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIjrZgR7dp+EH7DmWZ9zl/0I86QLRtWJ52RJzKOEy+8=;
        b=fSiiG3/zol3KYEsWp+6iSTYqy+kCihn3CH8Esb2wuYUiXC8abpVgDoUD090Mr9ENrK
         T4DSHtXEhOs28YU5FGkdvldStp0fc0s4xvUrItRVJ1xTP4YFG3bb+TJGlmfg3dKqUNOa
         lQbsl1iXyXhKKiCuXndLUhKGoLE58jOaz4XmBlnf031Dh8hB+d3YgKsVgzF+bhHdmTZ3
         bjv8LxSMjpmJ2E8WsNcRJgM3oxYrM8BvCdy/FoNgJQ+SIhuCpFD1XvKsQt7Ac8y8Tihq
         O9XNN2mxi4HwPa4R3vBXIUoWuxds2I/7kgghL3YRzaiXUQNUfd+1e9xuM4Tx6UbpVYdp
         8DIQ==
X-Gm-Message-State: AFq9FYIKrKzQpEj7kVjD0fJW3/yCdE/krt6JcPT/32/6jbJuRQMIdjfi
	/Dy/te/VVNiLPNxwXgh2CyQJxBHOweFRn+zMs9bkUnMTVXMwlQfm2318y+52gD05AZ929YGQ7Wc
	uKPMm/hRhj/J+f+F8g4kWNu5lo5s1E/tJek5qB6rlG58bxF1M6tAdPsyflmLpcUk4VPt72+8xXf
	1j
X-Gm-Gg: AYBFou0Bf40qKGuv7pD1SXqg8D1/GJkNnFfKYpiXJsudpCeogcGRSupwx9WIKvRc/ko
	xmB1cOOL/SXPlf0hEEDdk/HnPXmc0JXykjgpBhxl1hNbLwq3xg1XOnXhcJZlZf3eAJ9JGtMIiGw
	BCXkDvJMT2fW3xz4mCSBlMCsvyq2Fk/l0GEEdGQmfHrQriU3Aw7cj487r1ZlHLCshQfQrE8ewhJ
	2iN5XsMJmG57F45QTUkmcRZdEoTytMe/isWS7XZEQJDigIAQmCkTZZxTBJOSB+lvPGDu9VC9BJy
	TVgpcXexXVugs9zy3dsRZ84eJx6OSYTu0GZ8EszNFlsLbkoAEkW6TGwq/9Dh1ykPzBmTwUT7yYZ
	8vuzhOowfRnwGf9Znas89i2llUezh9tUtS583ARG3F7cT0lQ74jblHO/we3nbOAtPZZ08ed/bDj
	XurJFg5uwltZ/QEGclLIEEI2ON3IAmlD4B9ubuS4pAFgneND8rrBlacyPXg8p9Vm8QDeVXFHo=
X-Received: by 2002:a05:7300:d18b:b0:360:34e4:39d2 with SMTP id 5a478bee46e88-369e8492585mr13175239eec.10.1793101804341;
        Tue, 27 Oct 2026 04:50:04 -0700 (PDT)
X-Received: by 2002:a05:7300:d18b:b0:360:34e4:39d2 with SMTP id 5a478bee46e88-369e8492585mr13175144eec.10.1793101802250;
        Tue, 27 Oct 2026 04:50:02 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm61918825eec.23.2026.10.27.04.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:01 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Add support for Mahua QCB
Date: Tue, 27 Oct 2026 17:19:51 +0530
Message-ID: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae08fed cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=LhmUFbnPgsWGGw1Yd08A:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: BkVkD5MAxbX0IEauNpaSz4eFfHd0pwl9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX+MzvDay7DXW/
 mNk9paX0VxkzTTeZEqITkShC+T7wAhihgkIdP5HwgM+uABnuKXjJieZ+KOUoFiEdJQtDd6Q8keP
 XAMWUoEDCeBbT8c8b4UI3b/UUf3IMUg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX9hrqdFSIhDnC
 unT2+Oltc74w1ig4elDBhPYFAXPgs/BbfO9lDxLUuiz1rDPwznoZJt2LxEb+azAQh4yj963I9gg
 I0fJu/A8lxw0aods5zRVsOT5ntp24y6EkzhMiuWqWUPTqNTK1+66hLzmow8GU1Dzm0q/IcFv/8B
 c2DUNP0IqN3XTHCM922qj2kkMvdInS0LJE6bcNZIjEq+OE9WWfTHfLFUmRZgUNL7oj8yrkpFlWl
 TBe0Qt9hxCJ7iAomDBHoN4pj3w0Fxi2KLwT1Dtxno1B4eA/Z/4ieJISpIEHdahasMxVsufOhuv2
 ZnYTVHuMpEtARDi4WfWrcRrWqIcylG9gSLW/EiYfj3CVOsccSPYiCeV2d++a6+B/QHr999uJyS2
 Gz3b4uxEymDN6TxVXM7EM6FFDkodjPhR2vIPMIW5iOO95a8UabgGIHKC6wtZoAUNaXi9BcPGMkt
 EFiRQA1B2h0MS+USIjw==
X-Proofpoint-GUID: BkVkD5MAxbX0IEauNpaSz4eFfHd0pwl9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

Add initial device tree support for the Mahua QCB. The QCB (Qualcomm
Compute Board) is a board built on the Qualcomm Mahua SoC. Mahua is a
12 core derivative of the Glymur SoC.

Unlike the CRD, the QCB is suitable for compute workloads,
power measurements and oscilloscope-based hardware validation.

This series adds the bindings the board relies on and commonizes
Glymur QCB and Mahua QCB before enabling the device tree for Mahua
QCB:
- Document the qcom,mahua-qcb board compatible.
- Add Mahua QCB to QSEECOM allowlist.
- Moved common device tree nodes between Glymur QCB and Mahua QCB to
glymur-qcb.dtsi.

P.S. 
I tried b4 send, but for some reason the coverletter b4 generates doesnt
detect moving glymur-qcb.dts to glymur-qcb.dtsi.
Git also for some reason didnt detect the move by default, had to use
--find-copies and send the patch using git send-email.


Gopikrishna Garmidi (2):
  dt-bindings: arm: qcom: Add Mahua QCB
  firmware: qcom: scm: Allow QSEECOM on the Mahua QCB

Sivansh Gupta (2):
  arm64: dts: qcom: Commonize glymur-qcb.dts to glymur-qcb.dtsi
  arm64: dts: qcom: Add Mahua QCB

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/glymur-qcb.dts       | 667 +-----------------
 .../qcom/{glymur-qcb.dts => glymur-qcb.dtsi}  |  28 -
 arch/arm64/boot/dts/qcom/mahua-qcb.dts        |  38 +
 drivers/firmware/qcom/qcom_scm.c              |   1 +
 6 files changed, 42 insertions(+), 694 deletions(-)
 copy arch/arm64/boot/dts/qcom/{glymur-qcb.dts => glymur-qcb.dtsi} (94%)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-qcb.dts

-- 
2.43.0

