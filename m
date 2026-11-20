Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145318;
	b=VHBZEh73tjYxtTk9aDgZohwzMyGjM0edHLHAnNpmMt5fdWyLzQ3LL//qJGUJQqs4meU+
	 UtlxIW4sBk8xlQqxqOWW3mYMq+I1CdHTy4eaMLQ/zAijAeF1PKkI0SGi5lG5fOwN3/0yL
	 ziSdMOWPomlZeH1CPIIjU4PTS3x+V8BanwcGse+JKYC88CzWIPZ1EcCtH2KKA4tDrNP+I
	 oMLYCcYAV2pMZhNwsRiUUwyZn9JGIhP0ZWAaqxSxjCeUJ6WKHAvoGhibHCUpkFKr1ruhM
	 qMuUwUmYUT9Gyw+9I9VuIN7puB+oUpAiSyI2tqED+lhmoZIhGsF7Vk7nKxhau/II69A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145318;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=C85GEoHio01Tfu3juj1RmNlmMDQB1hScluFg/2tO4WUCcrA1DHDoDSnEGQSN/CJ28V3P
	 W5FkDp3/wvLQjYkO5UELHSeMxAPc2R1ejftLdS3AUUhaqrjzI3iJXDTCMT2H7DUwpA/kS
	 PKTNZe3syGdpNtGv5I+Vm0ixQy7R3KpFfheIX/RNq4hBk4zfWJayNDfGbYg714k98xw/4
	 nfqxe23E9kWlbyk1hR+76pKYeFej1V6z604NkLuxIhuIUCB2diKc7kcQHFT1muPBCc0FQ
	 oPZH4SUiqmq8GFl2kbp3JkwWA7vx4JX9RryKTD0wBvCGl/T91iDgI6BRkHqru+M3f5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDeISYqx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeS22c5y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E00E606A33E
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E00E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDeISYqx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeS22c5y
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GS8M1048768
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=GDeISYqxhLpiI6ZT
	/h4DSsdKrFb1/tGHg0KZEKVBTogTGlp5Y9yFstQKcw7FV70qzlJflik0NpvQpb+w
	2myyabskudEXvvVQZ+3lZmbctOif+sFbr+m/QHoT3YZM8oafKTc0BIPzGSfcF/wK
	bN8MpisJsvqUlllFjs7gp39eeawYaRtydA0EcPhm84CYCcbJS1YrdhQ5DFE+kzPr
	LKiZKyui0dbacYuSCzVjqdgyLoHw3hn7tZbldtYHILiUFPCddLKN4olbLB5YEuPV
	TNdpcZWHBFzNFtAPOMNE8T2tPlIfjUDEir31HGNON+dQ1p22qztJTeu/XcaogiD6
	JOsb+A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymmadx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:28:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso626949a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 19:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145317; x=1795750117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=TeS22c5yjgARcQcnfqvwlRNBPd7s2Gjr3JwrVSp06wtiCR2mBNIks49DInf4wO9FvH
         nBlrJyZrJ8yPZytRshFhqZ+cu/2R8DxDBntmZP6qDygFA+Tr54iLBComfUpMWW4TYGEM
         zZ7Q4JWkXoeQ0t7NNQ04JBr2/xuR++5dZXyu52SYtF6neFlep9CW5ln8ISwxdJShhV5R
         MWwX70JRaCpvOmPGGIfFRRRglO8WsYogt1H0jYzPLOXvoOgMwO7P8013bvvgNhIQImu1
         aQTnfxeEQ24F0v0+pYRe2prW9j0p4onVF5t+3ihpxfjEfQso+GuQ/zcl+h080Xm0hyjQ
         BwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145317; x=1795750117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=oy69RV3X/GS+GKo9k6i7nlopYu3kqES0eBmpFCq0DoS8yDQVOqruiwAdMMJAbc6UFz
         AJ+1E9Nnjltufc6eaa/nmeEzEge/46lhg4KArL+hye7OaNROJLIx9eUhTUjd5AL8XhoR
         QawNR6FP1jpDGAkF1g2MtjlDGzy2/fqLc136w0NLhp8a54dy2vNKVrNqjqBFPdrkbc88
         zpUHo6bzC6oP3J98Ny52jTemUvsWheWHPHX+kfNTHUISdd8s6dp7gTwYc0YtfmBkMLJb
         w90sbEypJzmfdSfYiLrmfftwRpu2T1KgQuvMHgpHzqZoeYSyVK6HFFrkSX3pLNiU5uEd
         JT8w==
X-Forwarded-Encrypted: i=1; AL+hErHcquJnMxfkq/qAtFa43r59RlQJZVup3aE7NCHo6ad5hdr5IlRiUatnzcEx7abtGwz6Uk3x7VRQmgn2ftlH@vger.kernel.org
X-Gm-Message-State: APuU4Z8r0B/vzntnODR358QeE1ZdK0yCWblk/1tBMZWV06jEWsilPexQ
	1m74vnOuiGg1f5C0IIX6y8oBc34OEGIxImJOocRGSbb/KPjjZixwdYls/dho8aS3GQAO8DPz0bv
	Ov97cDH9SxNN8vDIDmyVg4D5ca6B1H0aKQjmPfLI4ZDRY3QjsFPkJ+bkOz0aqTh0wsgru
X-Gm-Gg: AZFdTZe2A3tELy0Vp0gQPbKpTSP7G0Mb/Gy2s0xqRYFezrnc3lHGndwcrsGm0ZKeyyq
	///qg4IqdHxFP8H/umacusi0SDb+z2K+z6/i+F/IaxMWxiv1AvgZ3TXr1p0XC8pBNPs0pDVH2YV
	lXmLIfGkEsnoa8bMmqPEifsOrj1i6ouruL4E4jOwuUtWCMH+FbA1BB2of+OtbqvHgqIa1hpAIFl
	GVtVQUIEtRaVc4p/JxBXpiUcqYjjvfXL41svN5ICOgg70UwsDnpJ/lt3lYNyLPuxzl7yyDkrYg7
	a1mqGOf4+Kdy4CIj+BunyRoiRqs4Q5basGajmIRDhVZb1tvviT2Cc6GH2zbFGuJHuh4omfRiN1X
	Wjn2x1UZTjilP/wGbv8281NNVLEAI2eYtIZ9S1zZK+5Ot/WqdVXuEOsq/zynO8ylfi7J0p4zbJv
	cZWy+FZZZcvp/bww5YuC/EaEzVFtiloPBnj3o=
X-Received: by 2002:a17:90b:39a7:b0:3b3:9ce9:f747 with SMTP id 98e67ed59e1d1-3b41c9b2d4fmr1408354a91.19.1795145317128;
        Thu, 19 Nov 2026 19:28:37 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3b3:9ce9:f747 with SMTP id 98e67ed59e1d1-3b41c9b2d4fmr1408334a91.19.1795145316683;
        Thu, 19 Nov 2026 19:28:36 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:36 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:27 +0800
Subject: [PATCH v24 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-8-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145263; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=u/eNLPiVv6GIj/TZvX/nOtN65AZ7hldBM0ZBlHkuJ1IXZjkOses6gu/4+KMJnP0y8AMu8IKWV
 ZuDjkVOffhjB6SFchqtyVHPdp4eVjrvGCoWJMfiwPCAs1uKEM8zh1ZO
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX426CRIb02QRP
 xVGE6CWy5a7LRBMpPsjjZqdqa2Z2yIyfT83yo6tOVjrp6AeImH1hPbwzOfgk/3+0BQvQpR80cD1
 n3TRRei1I/33DsLcQp7xj+EjWTjZjLc=
X-Proofpoint-GUID: _yrAGpjSTAoZZHr4hmjbB_DSiITilawC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfXzq8gCLZLcX5F
 J3Tp8NiRFFTzYRq4QOSXQWYMrFd6sih22fq6rdRMl73w0I2YXDfh0kPStKCD2uaj0NNpg/C4vcR
 7l9X3JdBv9WrLjAIUSFVwPF3snBjyBO413UKQx/u5tElsF46i1htIg3ryY49BMl4SmSgXh8c8Bu
 7VrARmTBtodURNarMk/ZjB2Dcp0wm+bEhdTSWAfxGVGOmQ+GLzSB/VJxTXQFb3mROAJPonc6Ffj
 /axlti/c2Br3PZk70dkFFqJNpjFAzUW5r5hfewBHUR4EmigI+8V5P5OuLOdr+gbtAOGDINwsPpq
 v35E5+mCW9k26Xbq/pan0hwpZxKJpgE9mVJdZBRqVa45CGoqaKJY0KK97Nng+H5QvSh4j/SFGlz
 A6Pyv59t7Osh+i6Ls/BCOPYarrgCJDgv0CCmI9z+4elJkVxrlzpUdUUkt0rgTk6mtzM5cyxmI6d
 2xwNaDh/oEBzgPnMtWA==
X-Proofpoint-ORIG-GUID: _yrAGpjSTAoZZHr4hmjbB_DSiITilawC
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6affbe65 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200013

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

