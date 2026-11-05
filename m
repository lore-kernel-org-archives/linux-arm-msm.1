Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877083;
	b=IOZEHAVksBFB4XQ7ZPvdLV/lRpX62Vcyh2XX1lHBF6FN3imCuDWeB8T9xX0yh/f6P/Gd
	 9MDWfIktCZX3oqQnShKu3MwMuR9WQ+2YK5qJb36wioY0NQz/fmyurC321ctY2xaT4lOpF
	 snahDrmH9WDVt3A4g0fqGfjg1s66gvFdO3WnQ6SK4WJaVj9GdC8GQquMPcDFqsYqXXwP2
	 8V76491/LKAfB8unE1UmropXaPR0HUydbM/iHyP9h6BEZFGSJu8wwvhKk+SZWCkquwv7k
	 9S9e5pGXFVxhYUr7jn47EMvLsLZAby0e+f2ZzPeTwj7Y0fb8z/dBkeeo6xP9/mxQAAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yTUjoB2quATPPTKdjmhmFsI/0k5GGeEG+FF3P7TWbbY=;
	b=EzKJ8GpGrZ0OU14jtRwePZ6PfyF/UPBuyVRiDFuTEFjs8YH38bDt/BNlca+wbTQPzRVm
	 WS1/Gj1ilcT8RzKUTYX5olP59CMVbLapQxLK5eM8o9ThtgpWMBBTPosh+GgCsfy8GnvW7
	 VqA5kTSr9YditZ4lP7bgaQIOVoFGlsrhnJ2iQ5GAmHexoNOOSDDyctQbUA1w39SlyCScR
	 seVuABt0IVR5EBbtB4tSbQB3V8bpmxpkJprA8gerCX02kULYOTkceIYal+1GcZmbdzGjB
	 s6t55h4+G2aM0h6qKM2I1/U/LfPW3T65bfa2YoK3YgOvy7BUSyThk+k0MI2NLVyisJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A50yTwIG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HwsboA/K";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5080606A339
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 11:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5080606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A50yTwIG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HwsboA/K
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5B3O1R3193927
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 11:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yTUjoB2quATPPTKdjmhmFs
	I/0k5GGeEG+FF3P7TWbbY=; b=A50yTwIGKM5i1OQiJfTq48HjmfTZocnHk3E3JE
	muf8HCKcL3Bl8d0EtmHUnT7QgOus5/lEUXmGdFSpjxkSmju8BelOyG+vNv5gtmQh
	+cQtgFWY8iIqW10poJdEYx/72PyFiV8modbvvAplkHv45MuG2va0g3gqqNUOzCdj
	7WmK9jub8cw1XPyM7o6gqC6JSTG9pvd8aewK/iJRPT2Rp3rPZqxdJUU4RUBRCMcA
	b2/ChDLdnCvyK8VaAx/osKdrgM6GOFsR0tD8uOC8VghBT6Tb6ZuXFQD9CMefO2tt
	9Jta3wdViwvuFFjLhdEZY3CVBp4BZAbbkUNjUDvfmgbYed/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdr10t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 11:11:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944101e6367so105258585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 03:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877081; x=1794481881; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yTUjoB2quATPPTKdjmhmFsI/0k5GGeEG+FF3P7TWbbY=;
        b=HwsboA/KVViNXmME4Oy8ILCsun5gwThlDF07+xov0jBODudPsf5pKYygUt+JN0djFG
         xokcXkoUPMYKjgqfrIqL6vTwE2+k+hM/Wl1AduTxybKGMcG3MNxJ7G/IuhAWkR5yZHE+
         yOuXhns8zlVUM90oP/ATo8bl9KpTBGm6loUKh9Q9oEax7thrvktAYeVQIdwV9lzDzKyM
         ykBUi0GZgJJVFDyVaBE7lxG39ZG7WMzN8ftGE9sT+HL+ig2jDw6vOyYwCOEautRpizCU
         L4uQ055bfMgMYpTdXIslOQCgYHHjlYMMMO+aMa0hJpwHAIM5fE+QS/43kHI9uqZTqFFh
         LK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877081; x=1794481881;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yTUjoB2quATPPTKdjmhmFsI/0k5GGeEG+FF3P7TWbbY=;
        b=j0Nlz9noklH0LaXHFPAMpSEvlpEyYagYByPMvensckDwC8/Cr91+MWYlF35XiR73S/
         ds2Mi2uB7/wYsz+ehmzErM/lOwwT6YXPGCsra4X0i2eWNmRJbv+SxK6tgpWDhtXBlTOn
         oS/bdPa/xeIZagu2/1tkKtZrC6jcXxD6BKw9fAn6XPxpjDVqIuH1ABRtD+4q85yI82Xm
         rII6P1h6RPUYDj49LR3bLjyW2pOGY8k+GnvY4jJTfl6Eoj2s5MgTtnJgNc87nJXoRmAN
         okfKwDO8HjoPR4D97yd2bCTHaTMV0ZE/HpKWP2ud04WkGJjfBjdsOIYGr/1XByeSo5CH
         mU+A==
X-Forwarded-Encrypted: i=1; AKwUvBzkDb7kKe7uxbMfBHjuIcK1m4FAh/MOEAlqAcjOQh1LvHb/2iWEGWPDkYFDR/v7vIPFoVRjRhmKFno6sIiv@vger.kernel.org
X-Gm-Message-State: APuU4Z/WSlmzEfOepsYp0KBzBu0inKHMj2ZD+5d/UQBCZ+6JEhLsgQz+
	CqIqnjBsoXuGmLY8OrL1OVMDuCktiULda7pJt7Dzs5QTvrmBqABw0FyXPd1QNW6qARyDb2eIk2/
	XGRJ7nxUBar0zdKNcXpbOEuz7uqOVjoD2XIjd49/nngnj+dKLqTUDJceTLYBAThC4w6Rj
X-Gm-Gg: AYBFou11yKAwxPEcmz+wFdVtVlhXGOafNlMU2l8LyN4ZA5Ubi6ZEoaAdpSOOzwtQoFC
	CgMPNsxgz4GREdRGuafET52wKEpTTAlC5aVgNtKhESdtGO4V8mqsV2dSLAm05isTPrD3zPVLvES
	AMNsQY4Xt7bJ1So1pwQbGm2DrUwhTHuPJMaLCUOTGkK6pSqk7SkN8a6vxm/bN6pn8JaN8F0R/uk
	VAxnjbEZske1HguVo/xAkycci8CmxTBH+UIDYJXpeQ1Ja390u77DI9iFaWIJxknJePexDIANXIy
	ynrmbiqUuVIs4Oippq3hfUSlato4YqQeVvlsoXhdCfTNU/ovSxxtIsKPtQ29er4m/KIPWvqOAa5
	ci1NTvCEzfyXOcbXUVCsP9rJNgUqryrCQWiIiCxtmZyMS9/fHZ0BykY9pUED9ePUPWmKGiJIsu8
	w3bDB2NvCxx4Ww8m+ShgBB+JwvjXmb8f87l7PeRZ9o
X-Received: by 2002:a05:620a:258b:b0:93c:3863:ff7f with SMTP id af79cd13be357-945e1231638mr358616085a.0.1793877081035;
        Thu, 05 Nov 2026 03:11:21 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:93c:3863:ff7f with SMTP id af79cd13be357-945e1231638mr358611785a.0.1793877080528;
        Thu, 05 Nov 2026 03:11:20 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm438320685a.39.2026.11.05.03.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:19 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH RFC 0/3] Support the Nord CCI CCU output mux
Date: Thu, 05 Nov 2026 19:10:58 +0800
Message-Id: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAENk7GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNT3eTkUl1LS3ML00RTs5TkFAMloMqCotS0zAqwKdFKQW7OSrEQwaL
 UwlKgiSUQmdjaWgDg2c71bwAAAA==
X-Change-ID: 20261105-ccu-99785a56dcd0
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, vikram.sharma@oss.qualcomm.com,
        nihal.gupta@oss.qualcomm.com, vtumati@quicinc.com,
        bryan.odonoghue@linaro.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877074; l=2583;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=46oTe7kPy7FuqPo9XNr2S/V6jdi+yv6WkUX1TjqwpPM=;
 b=Dol529a6/PFWr/JmX2UCTfZDRm+kygGEkLiJ5I4XGx49aXLdT+Sl4/aG0KJUZRGVrOtpfvGyd
 4gV/RXtflxMBM/DfYF5SIV5V1/JEo4mgZ8kk/3WcZgDOVFHp2oa75LU
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec645a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zavQIZ2TttM9Dy2BN-UA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: na5yR2WQZC82iJKM5hloYCb7hN0tILAq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfXzULGZztDnszy
 2yE0ZZNAOjZE6XKbFub5q6RbI7FXYmayCAh0a2oEPu6F+GBRFIB5dkANwgiEcYdjPWUtdvGVXkp
 vEtD5+gUQzWhvCUHTvvulTlyz60/qSw=
X-Proofpoint-GUID: na5yR2WQZC82iJKM5hloYCb7hN0tILAq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX/hjXgad3ch3Q
 cRhWqzTmPIbVGzZMzzO1NxdSU0v2/aIbaeOlOEOcOBnW2LN61jEy8MZ3YRuGQHMfYeIOrU07LHF
 b704n1RdYrhRGZZWPakApeOxa3ucgUXgAUVNOdGji56bCjuHJoepyFbch6MmadxBTG3xpn/WXtf
 APQxZ1lQA/yRsWTyFhT1dYgcQgyn+oqsow67hL8qjC0wZnQ7BSHS47RVdkg+T7VOVCb/iDw5hlk
 Zzu901OEiZUqva2+MDpBHA2DVmBK0nAvzi6azEMFsDWOGfcdw9mcAL9eUVkWLFotieThauvMMRe
 SNiKoZRuZUgse98qbsuK4PrATCDqxRo+MY9Dp5AIoV8zbXWH7512CM6cK7faoUmZMGd5IhKhKLj
 IKgTlIfy+pSq3Iss8alvRBP/reImpjkrLs45dTT7kSxX3YRO3045zyEQZfXmhBza4iMihsefmXA
 j9sta6hzIcnUQmMbnCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050043

On Nord, the CCI controllers are wrapped by a CCU. After reset, the
CCI I2C ports are routed to the CCU, and the CCU output mux must select
the CCI before it can be used.

The mux register is part of CAM_TOP, a register block shared by
multiple camera components and outside the CCI and CAMSS register
ranges. Accessing the block requires the camera subsystem top power
domain and AHB clock, and its state is lost when the power domain is
turned off.

This RFC describes CAM_TOP as a syscon and lets each CCI reference its
mux configuration through a phandle, register offset and mask. The CCI
driver selects the CCI at probe and runtime resume, right after enabling
the CCI clocks and before the CCI is reset or configured.

	titan_cam_top: syscon@<addr> {
		compatible = "qcom,nord-titan-cam-top", "syscon";
		reg = <...>;
	};

	cci2: cci@<addr> {
		compatible = "qcom,nord-cci", "qcom,msm8996-cci";
		...
		qcom,ccu-mux-sel = <&titan_cam_top OFFSET MASK>;
	};

The CAM_TOP syscon does not describe its clock or power domain. A clock
attached to a syscon is kept prepared for the lifetime of the regmap,
which would keep the camera clock controller runtime active even when
the camera is idle. Instead, the CCI, as the consumer, writes the mux
with its own power domain and clocks, which include the AHB clock,
enabled.

An alternative is to introduce a dedicated CAM_TOP driver which owns
the clock and power domain, provides the regmap through
of_syscon_register_regmap() and handles runtime PM in its accessors.
This describes the hardware resources more completely and avoids the
debugfs issue, but adds a driver for a block currently used only by
the CCI.

We would like feedback on whether using a plain syscon with power and
clock management left to its consumer is acceptable, or whether CAM_TOP
should instead have a dedicated binding and driver.

---
Wenmeng Liu (3):
      dt-bindings: mfd: syscon: Add Qualcomm Nord Titan CAM_TOP
      dt-bindings: i2c: qcom-cci: Document Nord compatible
      i2c: qcom-cci: Support the CCU output mux

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      | 41 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  1 +
 drivers/i2c/busses/Kconfig                         |  1 +
 drivers/i2c/busses/i2c-qcom-cci.c                  | 42 ++++++++++++++++++++++
 4 files changed, 85 insertions(+)
---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-ccu-99785a56dcd0

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

