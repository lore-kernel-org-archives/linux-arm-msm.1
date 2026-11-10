Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273721;
	b=PXH7/cIAlinCrXVlLu9NXyZ8f096I7JWOx60h2oYef6JZdaoOnhl59fXvTiPyOXWdaJT
	 gM9J6/NKOnMqLqkP1ufDI7FYRY0nOhfGC0JGBY/zlGuBJJzYI4PKFyB3BVHxlVn3ixDJ4
	 w4krB3sbmAby5OSvou6tLGRD2RGOjkG633U4rItki/zhKybk6cwU1FZy2lu1MXzKq7Tiq
	 /wvObUdnSjDsGW6uRCk0rPOYSKWsrs31YMqsCLx6tpL0I4h87rrxSF3ibtwkWwIqy6nGc
	 wvokocm/Jh7hqx0LqkrZ8PZDMbRcWRBMUmnILdvxh8gZfZsDhJQIBEheFnHGMQIgnnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273721;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aqOh/ZwoTqzFj8vF7sb5XjQGmyniluEf1vOFoSQCafs=;
	b=BoFuDUp3n2Efg1g3pEfCPhNi/IT+4vtY1figxsooYjxHk052jrOV3fjnK2pX3tTwaadM
	 /dQ7VhB/vDwAILj7sfjpb03h1Gz/z7oYFprab0lL7qPDgN56R2sdO8tmASs5mlMGpjYYP
	 q/yHwv4VLLoxhAeSmiDB6QbvOVDUF3gyx7Jgj16TceWu3sGT+hIZ83DnUdtdrC7GdaWRS
	 z5CjVY7DfjZ3W/9V7/OcTNPxp4/rYyt25Ii6cSL9gPEA+EPYsExOtww6IdRn/yoBiK5hg
	 nTAae5SjBiJPZ4CZh8AaUYZYfmDawUvnBg2vngPR/XhMN+Y+F8F5ZgRztu0/EONgsgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLP2RjhF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMNEFUpW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54F606A33C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A54F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLP2RjhF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMNEFUpW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jKsb1514170
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqOh/ZwoTqzFj8vF7sb5XjQGmyniluEf1vOFoSQCafs=; b=FLP2RjhFF494uNys
	/SnHSHvLQddMnFXQ+1EPk8Z50Mpoi9+oovE3PIyYqip8f1U0yU3E6xa7kOwZea20
	Y1IIxjJs2XFQ8Sc7PHKg4Zys58YcFf47670+/HhHc5oVQIwct9Bn5tEKN0jWIfZl
	wyEsoSDXAE//vQ8ShkMJ2oUIIuwLHWfykgtXqqXufimC5eSK5j8pKS1qCtZghous
	0aIM8uVwS8hZ1T5k/+7vClDOEobXDYfdhy6Ox3tccKUYZh0htLhDYGi7y1UezDdx
	k1hCFGYG1hPi0a3SxPpaJGaM3hoBmyp4wkV9tV5Fhs/8WZJ5A9gVtPpnFLItKelQ
	TcVkoA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydjwvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:21:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e942b1cc86so14590125ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 17:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273718; x=1794878518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqOh/ZwoTqzFj8vF7sb5XjQGmyniluEf1vOFoSQCafs=;
        b=ZMNEFUpWqeN0PG4QnHHU3MvnQ7pjVYIgc4VaP+fYwV9bVOyhpcTx1GIaXyxRX5dZI4
         zjcdshm7tnA6YEtVROH7roXiRVw1Ls/ci3LtbWJ3bjHpIVTayVdf0ylzzgylqgzmbaRf
         C0pjbAGJIcbnYskyuVsSDvIGqpCzM/eecGccYM3FeAECfv4f2Z0C8rYSrFQEGjNR74M5
         vs9rL+LzzT1gvWut1hcryyl796lJZldaC8RonUt0p48hj7a2z9GuR3mPP5YEPsFVloh3
         jQKLaOfpeWoNGivBGIsHARBf0M7E+nRxEKPsNUkiJsFLFKbP90s/QE3n/83TA7mcnKKE
         gE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273718; x=1794878518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqOh/ZwoTqzFj8vF7sb5XjQGmyniluEf1vOFoSQCafs=;
        b=b/YvKAgMSeUVVMhWfOM6V36yxLwo1Tm1GVnp5EIQyXXsU2ls7rO+SEVpM7N3FqTV/3
         HaNh03el9n/Cf3//BpRDVMUth9/02oYJ9T/33Zc6w2Hy4M50kBtx3LuZkFQe+chGRhT9
         c1WRG9WrOf4/03GEz6C52rhqunFMNzNHzHg27HxPm2JLy171XhSCply9dzmDmOUlisQJ
         Q7er7Z3eDlM4d8FvUCnRrJBYBTBb6tjKHMxsadii7szjx9+Pt1jBuUGkNlKnGY4d5sY6
         a1WUYW9JmzFZ4ApVUF5bL+0yRZOVsgAVRgXwq5m8lwSp0A6s10CqX5PJrCNLulmqxbVs
         mvxQ==
X-Forwarded-Encrypted: i=1; AL+hErEM2Xn3cg2vTaWsy5/dynSTBQPbKvl2x4GkcTOl1l9NXSD9Dao3Y+X0wzbqVUgm7/TM7+XP8OiuirFp4xlP@vger.kernel.org
X-Gm-Message-State: APuU4Z+rFu9UbPIENK4ebdk16c/QBd3hzMaJtbjhgQUQGS+QzS5zs7Kf
	7LfGnuC3iCBpl9mV5Jr3enjKf8cpWAig7KFV1UHuVaC4xw+9xk6tqkRix/WmQkBP/ynMEwNCsmf
	2iBiVeQo5ByvGU23PQqS1vHYa3hFE9eYZtS/gKZC5KeqsBzhiDtpjMuVPMsmbDblsP9uR
X-Gm-Gg: AYBFou1p1onh4U9yQEj57I8bkYm7FeBhCUumNLHu1tF3mKxSaF2zoVBq/UkaQHk916i
	7mfhs3Uc8bdjLwWuIvSjS/Y2NP2SS45nur7Hk3XPq9nNjj5SqRkakn5wzm3jZXKByHMC69TXn6x
	C88jpscAjnZuo/sKh6iR74Kqhot/skTXPTIzOgwc3S0ibhk7jVkYx3EYiIiLYZdJPQaXqhXh2IW
	HvQRsxPUy5fiE6QQ11Qn9QO/Lv+x2xWT1vMW+zWHLFT+yYeaCZQ1crNVtlcI4XfF+3z9X7iikTs
	AgdmjxuKFvF5S8Zp5MfeA+Q7+Jwd5hKnG3HcpEupIRH3K5DG3ck9HNeH/gto5cjX2jzownmxRJy
	wVAcPIIsVJ4RcXZrdsJf7JgP00bFqFJLno19HXSuuIU71G0WNAYmI7YpC+93eZEsFaeQ4mCTaUR
	3m1+dtU7cIxB6s+cJEQ3dGizgGjtTiXtWuwbk=
X-Received: by 2002:a17:903:2350:b0:2ed:2176:2455 with SMTP id d9443c01a7336-2edb92027c9mr8719795ad.38.1794273718375;
        Mon, 09 Nov 2026 17:21:58 -0800 (PST)
X-Received: by 2002:a17:903:2350:b0:2ed:2176:2455 with SMTP id d9443c01a7336-2edb92027c9mr8718785ad.38.1794273715605;
        Mon, 09 Nov 2026 17:21:55 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:21:55 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:16 +0800
Subject: [PATCH v7 3/5] arm64: dts: qcom: kaanapali: bind traceNoC on the
 platform bus
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
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-3-2f06905c77fe@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273690; l=1695;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=e/VC4qEgu082rNQ9Rv5+87S6VUZB333iuAfgirzakG8=;
 b=sm+yNpYvjBZ286lnnvRQiD3nOrJzYp7GbSRJ7p4Rm2cr7rwt/kNMtAoD0o37S0+cCRxGJ9+S8
 SI2iKn7wv/iAsCnbhvHT4fUeGESSmnxyk2yAjomX7n7GjuQHatL/B4b
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX6BcY5Wtbc1Jn
 5bwR/M2jiSJP+IUV1em7SEC9p7m4l5u5tFKX6aNEXu3veqBuih6kdL9VmlYbscDKtveNaSGsEv1
 bCo4yay1rQ5zdZSETQFmrnC2kNyNo4g=
X-Proofpoint-GUID: wIoXf9P7wCPWc9wniXysigiOdPdXSCSM
X-Proofpoint-ORIG-GUID: wIoXf9P7wCPWc9wniXysigiOdPdXSCSM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX6aLddsfESYxE
 vfSZBDGPIORDb+ZroB2gy3MNPdv5eq6pwWEMaUUR+KzwtJgIygMsXnapPzGhfVfxJ7cT93Q8Hiq
 Dl5auzcOYM9f/FQxHURw3tkjTwMUV/9XTkg/bVyfveuAFfuVw4SDo4TVwNp39oEzA/esxcls3B0
 3WqtUvy7dqfSPVgJYUG9bRE8n5mzNtzir8tdUl7C4NHExHNJ35PzMFQBPGdqTWP00LdCLSckQbJ
 3n0PXeUlKNTkpHGFXlfJZ2OLabZahMvmsYKhG96i83XxI0DbNOEHaWMLvlNSzpzVRXJNYIvvQLS
 P7mmx6NGKIP7sXQZU4g9lMmlhVt01eCfX1JXRja1ZoqCIWUTmYEBrhp4/lkWE4lp2bwwsPCcBsM
 C+7+EDdR7hlAisozlK/63ZauKoXogxjhmZzSVE2072Zo9BBjdF00I7NLTd4SREFugSGvrMM1jwl
 R+1iWKLPAr1VrDMbWeA==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af271b7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7Rut49xxg77_icr6qwgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100005

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The traceNoC exposes the CID registers, but the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the match never succeeds, the AMBA probe fails, and the
device is left stuck in deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on the component ID register at all. This lets the device
probe on hardware that does not return a valid CID, while remaining an
Aggregator TNOC that retains ATID functionality.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..de135eee0aed 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5414,7 +5414,7 @@ tpdm_pcie_rscc_out: endpoint {
 		};
 
 		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1

