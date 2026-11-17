Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922715;
	b=WmMTz9ekf6jc4nvkUUo5KIu7w6CAlAii9ptZhFoDeQqUBZutQQxXIVl8XuAgOcO1hr6A
	 4o/NDYqKurzsJBOARFjtACpC4k6tLJeLKT7PY2szbMLD1tZMJB/uFqAwjKU1t2L1yLfgl
	 /JZTj7voaJQ0UHb/zvA9Z6ovojCS6cV43fAw9TpGziWQuQPMhAMBBaVfYWH/Z5reTq42P
	 MvdxAyFxO+2lIYC4HXeAUrXiaZEqrRkcFGFeFUEHNDxyO/wkWZB0tJ5q6U6/0IlrYdjM5
	 8cWOF+2avz9THc3LLcS6ihFQUwJIhroDHhiRxm65wknM77wBKjhPXeu41u5ct1qzaKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922715;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ypdzp5pZvFTic4IdTV8lCb2ZP8fhRRa6XxVVykZkffA=;
	b=S3XXEr2pakUi2AhuQ0MwolVxMIk4cHUp4jetNfCFbkQinnf17NuD3D8bBKgl3FTbgHbv
	 xgqxzGGXCxWS0WJlq/+w8txDVJUYDPxtBuvWMtKRuwcG8piwPOzzbAw78Xn4XtDfKM4MX
	 +ApSoudwK/jL4rn6s6bfUSQl96UJ01HV6tqg8DrTMPQO3t4QfS/66dWbxzmVSP2Kpa6O1
	 hX8HTLF6+SiiDMNFRv2ruAxGKmHux4c5fnRLezfXhz0SgGNeMecSW0CA/Kbj0adirQ3/y
	 CK8YFjrCccUTJ/5YGWZUpjofVA2kGBxJxSt2Dz9VKgk5UK+p8xrwnEXS/7MA7dEeANQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IaBduLal;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3HH6Hhx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC5E606A339
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 13:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC5E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IaBduLal;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3HH6Hhx
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0nmk1457352
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 13:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ypdzp5pZvFT
	ic4IdTV8lCb2ZP8fhRRa6XxVVykZkffA=; b=IaBduLalycAfhapOQyblUagfKvB
	Y908DSh7W/ocWxYwKauIW0x7iUFRFcrvfom2kMEaQroG1Hh4DGU968AL9TvEqTBu
	zxYKvhN76Hcd7hvMXo3Cvyk24napwL+dPSK34EkJGvKMnMxcSoohCX6dH0vLTpOz
	nTvFfgIJW+Z1rpJMuolv21bzXckQWRZWZmN/16ggo/a43O2zXJ2Lm5CXiUhM5EO2
	I/mDTRobudmQbUHd3ZAGFogshDPQbv9im8qiOv2Zu5gzQ4Lx2UaP3jh5BvydogiZ
	hgX3PxJV5o4K5LeDx8cgq/soIS/V7U4IcpRICUc9hJEbvcl67pldbMU1gCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc80pv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 13:38:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-948d83322f6so781060185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 05:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922713; x=1795527513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ypdzp5pZvFTic4IdTV8lCb2ZP8fhRRa6XxVVykZkffA=;
        b=D3HH6HhxxsW8csObcOTpZrKBmKdmFbqvRZa3Lmi5fIlgOmPmnMfANjdE4gH46ZFYJl
         11Y4Jr0aPaw982oFT4SzTg0zsTNz8CyQGIPO/ghW1ktJOS6n/9qfi/Hmkn5Jx9L7Jb5C
         NuC5uFN7TaA80+Fg2JqmudFqUEdHcT1aGPXGfdz19ykUF4GfMV3fdALBXwOg9fijIwbv
         Ms+OczCP83VOeA3MZ3I/U/AybzcpxdPrZOl4ecgwZL0udkJ763AnIb6x87hMnJU8OlSY
         66F+0Fea5zAVncDLpJ4p+RhC9tFWy8w8f4KBg3t+d8npaJFDNqZtMmWAN7PWEtS+hbS2
         wm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922713; x=1795527513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ypdzp5pZvFTic4IdTV8lCb2ZP8fhRRa6XxVVykZkffA=;
        b=eKSgDhoJEss/Fpp4Z5m6L9Rcedgl8jEI7zQQ5QuS7Cem7uW8e+Z+eoLzfDaTQ19H+h
         8k6F7g858D/jjppCYqKBsAlNgjLAWFQu7bR8tZOHzSUetrPpyqabijL4vcUTFCL8r88x
         JHkvPPJnW89jj2U519Zq4A96Nnn0krRK0glgmlybs61BPh7Jbtt4zRZyCFsT0n4n1UNG
         QEExNaOjBKyVzg9h/2CAtUAYrRUrfPZD6Xrm8TsWUo1a/66uq0FycgzGMmAxkJgt23RI
         6AqFLHfF6bpPwA2BsGn4Y9U2bNqBxtAEGqWH8Jf2SNhuGsONBN2maqAmuFFa9ku6NQMO
         umNw==
X-Forwarded-Encrypted: i=1; AL+hErF5KFeT/jJocHQwzizGLqMJuDDpMYu3O3dAY6Y2RYDOB0v2iVYKqNv03ygy2wleLp3+wdJf+vQzKvaOU6Cy@vger.kernel.org
X-Gm-Message-State: APuU4Z87zlK+eHfGwiV3Ve9asxWZyCoJhbcr6eUxMkACm7k2vOkQo3yW
	7UyD6/WuK/j8h8SPNQL2c9Bne7HsZM+dOmDa/XSmn7wME74GiOIQ0tUxnU83FmOVO0CcXHaGkCL
	rG3xLEy9Ne0haKZCAHw58koGN+sO8MhTCm3MUsSTjDYtx9LC58z/QbboaJ1irQKHtGfO+
X-Gm-Gg: AYBFou2gDNhFke9b1VkTkVBb2lT/VIJCZjj6YWtTZGXUsonDAs6Ge3S383Gy1HxLAL8
	fnwHE5mXGZDWIlPWTjB9p5VA/tKIEFvKHZtXoODkE4mDDDr2G6NVBbu6Mpr6+HKhPFax8CG9eEu
	3oQm305F21D0601SK9GDZgW6lRmOX39CjmE9xEzl8z20mkU8ZEayZNGC+DSyA3OufA7hEdpitGM
	XNbrO+i9DWF6AOSdgnGzNtEbqjWgFKVqj7S5yEd2RawSueBnVfG/cDIyij1Hr0bcWOK2THh1kcV
	GGgK7swxvkk2zfvL0/LnHBqLXZTLSGspIIDZ9G64C/zaRoDK7Y3gNtkO+geJso0jrbDg+fO9sbK
	Z/LFurBxbzyc59hwI3O8hEaZefln8NcP1owrO4CVBSba5GGUusW/tVX/eCP7nUQ==
X-Received: by 2002:a05:620a:2805:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9494bbdd1e6mr2356259285a.17.1794922712849;
        Tue, 17 Nov 2026 05:38:32 -0800 (PST)
X-Received: by 2002:a05:620a:2805:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9494bbdd1e6mr2356255285a.17.1794922712412;
        Tue, 17 Nov 2026 05:38:32 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3d39b8a37sm4080746f8f.46.2026.11.17.05.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:38:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: Remove deprecated hsuart aliases
Date: Tue, 17 Nov 2026 14:38:27 +0100
Message-ID: <20261117133825.245191-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117133825.245191-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117133825.245191-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2384; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=aAypSiIb+NdhpmV/BXKYvfsEnu+oEKxqPUJEvUhAaXA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FjSHEEXQ8xrlfvvBIHQ3+gVt9YSiaiwOC+Ye
 6YRCiNk9mGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxY0gAKCRDBN2bmhouD
 139gD/936Q6wb0ITKZcl21iLCpQPoU3xZ1qBFHjuns5nQk4f/2oxvvbUXT05V3hdbjJSgzbrmby
 gt3ytH3PPEQgrDrmoBKp2z08nGaIWeRIrAciGLSieQCmxRXEY1e+nBGj59g/s4/Lfl6Ng9VCXnt
 2plAi4sfDATNzKWPzjAC6QF1BLj6S3QQjMhFl6DOJ+LEbAxypb+r1bSVr5YXpCm+vZTUlP2d9MO
 Pw4wNWYoUqHUStr0GgYaRK/hnsToUn1MlkE5eGGYK6VJ3+CU4x27FmmB8jCiJD36RwK1RzyVKFk
 CSZ7h3yTOHwkF9i6M+/7zFGvPVaigJVPPgWNdSrmtgu3skZ8Z20cWRgkyq8cKB9XwZDtiTupgQF
 fGWX4BQJ9oqwmJDlBlf3hXHUO22bCeJtK7Bx0gYsrCOZPhZwTDtBd4fkzVdOVYvOXlYK61ja6Wt
 sLsjXi/0cRmFtcRMOuHS8Tv6UgJCMT03awPsd8eyViZtuAs78C1CYh87yS2ICwV0UP/ppa2n0oE
 pvCL6Ydq9a7YmwM2X7YWKmC52HTxzy3WmgFOeMbBxzy2zIYUL7SLVuS7S3D4rZBDOglsixnE+JS
 grYAWJ9E//WraBnvsxc5v/RPQBAy8uZZkha3LH3seLsIXa5UQtzIageH44ueQL68BJaImn7+XQe 9gsxv0/u7Utzadw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc58d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=SxBGgXQjZoWNU_3oOncA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX5719fk8TWHCN
 tydaOCK2mmuZF4nymVQJEkG7QaqmYFwGlFU06tYBhcYD6wdaGdbYsY66R0q8u3p/YRxI/zawRqA
 IZoplLuvsGuCkcVhuyrUXJTd/WV+dq0=
X-Proofpoint-GUID: 0vMkKv7ZqpfLHtd7gcbI4v4_VFpRfj1M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfXxAKqR/974RAW
 q5iK60OP4QmR95vvUMOfgMQxArEAdRMIQq+q/+mYf8qeHrqEZOvYPuclr3URKWdnmigJJTtFdoj
 rdIqQGfOt3WsVU6SbZ5XajlrwmjgnZmiG6cTAXpIP3XQisEfMqGweiYMCvcEXZALzMCFfaf1FsL
 2q+9iznT7WIJJowy5i0aHPGGfbSIFZNubV216H1pOBBXGStewgY4+SuEKFHX+WXIYmrC+Q2B/cn
 5GGNIlEGfbWGGLosS2l5QxcKz0v54Q6gGBoMGprFLrWaAbmUb6wecb/L2ORiIM38XUkUHso68x3
 ndEkEaj8nSK/raEGVexCOqtyrZycVAU7c6Wjte42IMiqkokTHik7hDRzfV0LfDEo05XSdvZzGBX
 h2xBImn+2CLaK27eiWbfBxDgQct2wNLNc4AyhJag8ex4n1IDKB36LNGq0y6LbSisCgmUYjCDaAo
 vqiKXXMFzSZ9Jjuog9g==
X-Proofpoint-ORIG-GUID: 0vMkKv7ZqpfLHtd7gcbI4v4_VFpRfj1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

hsuart aliases are deprecated and not needed since 2021
commit 08b0adb1ae54 ("serial: qcom_geni_serial: use DT aliases according
to DT bindings"), because users should use standard and approved
"serial" alias.

Remove these deprecated aliases.  This might affect other projects if
they did not update themselves from 2021 to use approved ABI.

No new custom aliases are allowed for years now.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts   | 1 -
 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            | 1 -
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       | 1 -
 4 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index d9c70897b6f1..fccd0931a969 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -21,7 +21,6 @@ / {
 
 	aliases {
 		bluetooth0 = &bluetooth;
-		hsuart0 = &uart3;
 		serial0 = &uart8;
 		wifi0 = &wifi;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts b/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
index 3100fab18787..58b93c49ccf1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
@@ -21,7 +21,7 @@ / {
 
 	aliases {
 		bluetooth0 = &bluetooth;
-		hsuart0 = &uart3;
+		serial0 = &uart3;
 		wifi0 = &wifi;
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index acfb9937651d..7d830b25d8c6 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -21,7 +21,6 @@ / {
 
 	aliases {
 		bluetooth0 = &bluetooth;
-		hsuart0 = &uart3;
 		serial0 = &uart8;
 		wifi0 = &wifi;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 0e0bc8543f71..560a650b0966 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -90,7 +90,6 @@ mdata_mem: mpss-metadata {
 
 	aliases {
 		bluetooth0 = &bluetooth;
-		hsuart0 = &uart3;
 		serial0 = &uart8;
 		wifi0 = &wifi;
 	};
-- 
2.53.0

