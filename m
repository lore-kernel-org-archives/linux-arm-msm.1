Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273724;
	b=x61JCuVGmjn4bMFUnuJXAnuM2x7xUvDseCifXF0fxbeeiID0gW/ACuW8zeZ/QMUH00Qa
	 y4DoNXNoloPjLqc3nYU/u/TyLHqhSEsIAV+m0LQ1NpCYnz+uEVPofF5CAyHMEK2b9O8a0
	 rcR3pM4a5DqQaLfMr2NhS+UjlKcTutsD3cczkEcCQ7KZ8DI0Cvk/tKzvRn2ZbqvKdLrEu
	 c+WdTksLZvBLjl9XkcA8a1rDl5+jo2icHWrlnvd2CssgkpvSHiORkQ1fUjsFnhqKXhEW+
	 ErkUKEg5HTC3/7bh95jw9V5fL4WLQfJBq9u7vt20zLRPuT87R+cGpkC4PRSab+4ad2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=;
	b=wbTZyUprEaP+D/mT2QZsqNWQtsbYr8QI7eQup+U94xX/n5NvJmmjdZy3Nkb9wyBNNRo6
	 RAS2PYfhh1DicIIZ3uvzMWLFZuLdZkLH6xZIkSl1mTVEoavaIav0GU4EBrtxQDyV3cL62
	 1iU+kqpzOYduVUUDn/Teag9L9xU9xWvt19HVB0/HkbTuKlGXjoTCZLZgpkcI3sqZ/Q/wk
	 9NoXUUakB/+XEBVQmdA/jEzdWkrY/XA0wsdSxuuNPHZEIRfFJVo2Ts0S5O4r6BJ/3F9Lf
	 Ih5Qv/OIdHe10Ek7bbQ7RRSh19tKYB/dRyW82MfVyCHH/6vf1p9PcipHPlqenmacm7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dsq7N+Jh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RGhkUH0X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB52460A3817
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB52460A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dsq7N+Jh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RGhkUH0X
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0irhX887512
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=; b=dsq7N+JhZMxNrVHK
	6avJUuU8XEYPugS+EB2pbkOQeq9tS8ttDck1z8A7L1yul5jIHwTYekIaQdUL40PM
	5eI1zQ7Zn+nK6BiIVKVz8tWTd/zaypIQ8N5bbHf5rgkxQVDtafCdPTSmUxmURJ1J
	KjhmyKGUZWn/ulqlrlAHJYFLr3fl/6OtYfnifwY2k8EMFHiJBofTPy6EHq3RDPXd
	jPPqImrLr8AOaCO1b751WfEFGQm+TQHi/XHnz/upu6dtqXArAYe96IN6nxNI6A5d
	1VJnk9K27deOwEpZ8s4ULqSRa06rFVVvkp28uUUvYyaR8O4yXJyuKLC/VRy2aqGk
	g+MFkw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcjasbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:22:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e987ec84afso14404605ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 17:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273722; x=1794878522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=;
        b=RGhkUH0XPlh9V+X7C6THVKsJ9FzptRLO8aUNU1NraM06Hbx9q0A2I7ZOY5urR9XlJ3
         bHzBA16GBvb4KgwZV/e06TGUisHlaNTfA/lBg9iXAl5gNAzbHuVxR5u9L+C+/aLilBun
         tEZu/AeEJ3V7Kb6odrq5HgNi0J6ZCFv9hgcx49TH9mXcJ4PWdXQDA5FKhJYiknUa3oil
         xwVaJcq1cOISXJ0WBdbZJe7jfqNZ2WDJKteYzLTN9IVlTe7+3kNW6CxknnIn7GzLi3T5
         ge1NXXfbNijKGZZGf2QYPlFVttLXtwDE+KrBQaF46e9YS6q5UCTq4FAjMthEK1OagioC
         iIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273722; x=1794878522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=;
        b=qzuZnilR2gzo0CiQeYDzhAVAp1eHY51xa9oM20YyCtsAH92H+L5dWkrUG96xCOqQL/
         ECjxpsVBMWbuvN78dyAbSA4tq0jD3cc+EpTlzmaYsq+gHSNstjd4R34GBc0EgEAq0rwz
         xw6k3MQJQRZNeJHNNGtF9g1deV1yNbV7pe0xUwwWRfho8RZa+4wtGGaGdeRM5DKxFL/9
         iRmxkn84sQ9tKBdsfHqTM3MZBRZeNJXEuQq81Uv2Y5IPpVzVhNBnlMFCzBl0EGZ30ctK
         Ly670Paqj55AaDEBm5qP166lLWN5KrcFG3+oJWcD/8VdQX8q1VMNRdvrQAIEJFyR90Mm
         yjrw==
X-Forwarded-Encrypted: i=1; AL+hErH8Vxem0etrjxLHOhCEYnKzemjECB6gpuynICg9RD9UbmoIDwpBtV2PnwWegDS4ifnWzVbQziyIVwN50wUY@vger.kernel.org
X-Gm-Message-State: APuU4Z+KN7P3018NKCLQ4pLlLz0PJyWHAOJQdtxYh1b14FzRKkVTHqWn
	4r3HqLwf2MfwkDZDtMgzttG2DlBgMisN3FRpHWi6L54Z/MnNihIvWzV3s+FFG+tEUS7PvORKvtc
	Z7ifLTbluLUr5+OvoPNUtl+CDNgLcM9QW0fCExQFFE1dxSMBoo/5+RvMSeVYJNjO2Z3cH
X-Gm-Gg: AYBFou2ZBmzUmSLhxZcyVrkiu0TzcI/4H22zZJ/EK+FkzxlgLLbmJgOh574mvfMXdJ2
	Y4zFV0X7LUsumkEP9Offltid+nSBkCRz740YEKR35PNZUCHzZMfHf/JjMYUZyScZslmcIsJq2qV
	b9/cfUiYuFLJM+M697VS3omSdiRA6nnMzvhbf5j1HTblSdKScg30Q9JnrL0Gse+kXFwYhOrshIK
	O1kydNYogKkAcKSgRATszSvVhW+Pd8fS5dwglDsT7eQFk+FFK2NmYF3gmTV4ZbS5XFb1CBbZYIF
	UajaVSD9w6SYE2mMFTfjRpN6wo+FTxEcDaj4svKXxXyvyRV4cw4ZW2bFkntWARUZf6MJ+1pM011
	/BPNGO/6rJf2kaLvpLNATokOhlfgJzlGHXrZ/HE2JO4DLncC+vwf7Km4InKaGwpcYDbBq+rICQb
	f9YqNnsrqxKN7f7LAFrAkhi9k+mAspp/wOsKY=
X-Received: by 2002:a17:903:3708:b0:2ed:4c7a:31e4 with SMTP id d9443c01a7336-2edb8f95b9fmr9076455ad.1.1794273722117;
        Mon, 09 Nov 2026 17:22:02 -0800 (PST)
X-Received: by 2002:a17:903:3708:b0:2ed:4c7a:31e4 with SMTP id d9443c01a7336-2edb8f95b9fmr9076165ad.1.1794273721629;
        Mon, 09 Nov 2026 17:22:01 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:22:01 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:17 +0800
Subject: [PATCH v7 4/5] arm64: dts: qcom: sm8750: bind traceNoC on the
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
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-4-2f06905c77fe@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273690; l=1677;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=kZiNHGuoVNQkmFL0f1QJxaveTsNubLnCPGMK37H6F3U=;
 b=e3fMacKJRF3qjdJA+5qwXtZU3e/TGJVbSK8JjnWWrajul9wrlr2x33918PI81Yq/4MBAFZPAN
 GNkwgEpZYYAC0BEf8rSHydVrEwYZ7b9AW794RJSuX6CJPb9gfS1BoYv
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: fPYo1H6JPgK3MBQujgQ-K2KTylronf33
X-Proofpoint-ORIG-GUID: fPYo1H6JPgK3MBQujgQ-K2KTylronf33
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af271ba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7Rut49xxg77_icr6qwgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX5eORmSJapEg4
 EV6B/0jS2/Rl34Y5hagt+BrvcqMXaATEld5/7sLLupmlWBtHQ1CLebTfj+WinkTgx02mHfwn0uI
 TanCCgD1C8P57YnwtZw6CmM7xUeX4Ik=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX2K4v6FkeomlV
 u7+x1hXo7zISLjwSrRwqaQwq2q1kK0OOqGiseJ/tYYXhmD6HLEWEmlSnM2YTVd3rz1BVIX/b3Dy
 1OjR6X11SyR5ERPOvCdKoPcA4dfIwTya0+MXjUEwszYxAkc2AKIgQXmbhcoEpt5/Uo1Y5lwvOeh
 3GhZ1rKUzDcI2E0cnIQNwy8tp/OMmI6Scwl6eYsYA6HPPZi2m17V13YF8Fl4euxQB3hAZeIsWGP
 8od5ew8vM4msCCq8Jq7W48fsymJolbw6gCeSshSk5Ycq4AmdDGJbbkQrvuOuDIgUAYNLCsDmcdf
 Y/qczsDGQpvihE0fGGwFxIFzhYRY9fykFGdlX+IENrCUsYkaAGQSptpFAAFPKROZyTAUGVFXHbd
 37r/UsZnSnqAfdfToKIwSK44dJJ7/TCLFvuOboWyTKy/KdpNMi6yiz4x504nIVy0H4iP0Pe6kCd
 0jB8KIrqhEkA7jceKsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc5760..13f05c0d67f6 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5172,7 +5172,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		};
 
 		tn@109ab000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1

