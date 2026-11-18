Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985430;
	b=iwkEf7JCFpxmRGseGXt9IIPLQa+aFlC3e0+xJBF+7teDdJuIhgsNAfWZWU5pBJ+5Nna1
	 nmE9nX86Cn2D7AyQloL+RSSxPamJONeyYl1IFehVi3mW1nfo07CidjHMo9swkWC1p1WG8
	 S9Jtdo8UkARhr4xeabKMsz2Rx7VMg+XZOh58WICT+rbjch4d+KSP6VSFIFHgID11uliaW
	 bAp32SEDBqLLCw0cTKjYuouUlmGjMBvlcrptoxMfv1sA+jZYtLUy0AkxlK9If9zL9D7SK
	 BbAHki3G/8a7JprAgcSuG3/ND/14WNR+uJlMg/b+XiHtHlc+st+dgrstY0JSl5FZE1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FIpuz+xBMUTBhU7t2Fe2dt+EFR8kWBq0TfzDVI/CDwc=;
	b=2FM+P1JQVg7vk+ycETU6IUEAgdsqF3liCRmcGXzS60awAgGpBtjinF1y8HamcBuA5oOj
	 BQzMR/8SAKhIG3EEQ0r9nbz5DJ84p2yPaYWXya2j4AckgNes06cklj4o7zAJDVVFszVQn
	 UsYfkVDdFbDvzf8dctTnLo3rD/jxfme49lH8JdvseNoXrkfJiSDGQjZGJkkTNeGcUC+tX
	 DC6eJQdcUpxF8Kaj/HZkLrYxw1s4mN7GAlfTom6zsaCedPaFhYyqD19+/Cbi8/WHZasxc
	 fbHVd3NVDrbcg1eXUBbXWOM2i0/PS/6k41sSJJVy9yj6VO6tzz+enzHwgplOjZxYTiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WdXe2tDZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CFM8MqLq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1590606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1590606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WdXe2tDZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CFM8MqLq
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VxaI4059986
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FIpuz+xBMUTBhU7t2Fe2dt+EFR8kWBq0TfzDVI/CDwc=; b=WdXe2tDZ7AO7Dnmk
	un24RsBpgcptwArLeHZdZcJgWS9PpKr6H/ciP72hTBPG70SbDhmVShXoUC60Ne3f
	UFeoI4t8KykS/UjBiOk/pIGbfkiEiQHTJIZf6S3HjMCO0zp3cRRxBd4dwA5//ao0
	99MKczL3hODhJ+Z6eoyl3WJP3P6lyWI2uM9Qw2C15qFCrKWV00j32wbRZ7PmiGin
	bii6UqvLtUp5lWAv4VInwx0Qw2/EHjIZmGs/cYhsay6o4f2k2r6eroHDOQUbpxsi
	MF74hikY44h6NwxJ2pTNohT7zQbwhTvVQ9jong3JiyhR4Zieqog2Sz59AwDOfxBv
	HOl8MQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchr22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:03:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed02a00b24so6525815ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985428; x=1795590228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FIpuz+xBMUTBhU7t2Fe2dt+EFR8kWBq0TfzDVI/CDwc=;
        b=CFM8MqLqWL2fde2SIJ8TLdaxcAH3pP8/ANJNeuzbMkkpWzCPS9fAE/rbw47crgXCvr
         84FtaQX2R0sox42PfvadWid9SQfZFWReNark60unUMkzj3jEw798u1I30N9DthGhMR6M
         1UWQFATTwz+GKfdvl0e/OZQndMkgryIEWZQHDP43smhs1/8YJ3vmjMG+seqR3XTMpMVM
         fYFPJbNToxcieTBLR2xgRkd2jlqa7dCfX+itwIoIKXZng5iR+9p5H9Ov85I4KntQPaIw
         rZ5dfXcbx46M6du10elO/XE0LUEKLjjjozvIdk7/AOyprtW6QT62N61XjZv1aBQWkC4i
         vdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985428; x=1795590228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FIpuz+xBMUTBhU7t2Fe2dt+EFR8kWBq0TfzDVI/CDwc=;
        b=NqD8Cy9cRVsMdv83VoEbCB3BM2GMLybB/b/Llddey1soqYlNwqJMr6+vkRo/HdXn9/
         s9by6TR9KjeXuvLwU2EVz8LTOs5aJAd9rkPhHzipUktUy9E/lHDnVPoMFEZimWT/asst
         l0LrayMo3LBIQ3ep/FML8EKStM19FxEQlbgSPEzVjL6pLKU/ApYxE6R9lOkxLLKPYFmE
         4rumFfVSemfiJcE1A51NofHloEG/sI6+l3KoQppq1WWSdG8tIekKaicib8DKYhsPVMsl
         n+1I2FmHH2dzJ+ppnm5CAGLu2Hzeis9jRuBK6YBcjyRMOe+9+OVXiTZ1BnPWtYXiLXzy
         NhdQ==
X-Forwarded-Encrypted: i=1; AL+hErGqt0AC24KV2qE+P4Q1xrLuCgBR4D4OWwIwdslqOttbpiNnyLJWfKQ0HF/ACG+1A/DqF6A6XiSFe3wpEj7N@vger.kernel.org
X-Gm-Message-State: APuU4Z+6tNRkKUCJdXDHjje7+vBgGmtVBODp4RqK4LIoZMEMYzq2ASmY
	3PP494ewuc+u3KuUPibDSB11qSEQ/3n5UoOW8gUFEfm7dh7GseYLRHwUmQpcP8oCuhmOz61dc02
	Flgf5/0cssMpLeOy7to79CIrq5PicRw1ittE59KKq+N2d5tWoid/o5Hb6orqZg4VWMWDf
X-Gm-Gg: AZFdTZdhMZgaiBFZYSpbyt4wbobOu9GApQuHdz325jGI2ZJSSlJXM7zM18d/5XL8IMx
	zvmrzyRTfJqFr10OVs53opSeFjkX4v/1tKePqqvbIh+jaGaANKhEun2Zn57oiCOSLkyeN64Mb28
	hZu7vGsC/Xp8rkQhJRJxTJxdCupIWyrLjSlghy1dKMFqfxIYD2rAqZGesQzgbFkCOu/5cxB312S
	ljC22d24l/2KmALSADuIRRuYYxsg76EPRtqYnnSwwSpFSUJ+KKopWj8XiQ3Y2SwEiDHuZDqDH+0
	qvF4d6KuDUQNRTADDTafUxggd0Tz0pXVHmrQ+bAm0E8DMIChBSqQaxRY3geeu7Spmdxd4plv8vr
	IxvcUczmhiVouew4xtVgT8LfFTLhFjii9tJI3oaHGHfjg0MCdXWia5QoTJbqqa0gUm88y6h7ckH
	20sVW2reohUmfGSQdG+6megD5x6qhLztPydbRG
X-Received: by 2002:a17:903:32c1:b0:2e9:79db:449c with SMTP id d9443c01a7336-2eff758e055mr14931225ad.47.1794985427892;
        Tue, 17 Nov 2026 23:03:47 -0800 (PST)
X-Received: by 2002:a17:903:32c1:b0:2e9:79db:449c with SMTP id d9443c01a7336-2eff758e055mr14930935ad.47.1794985427423;
        Tue, 17 Nov 2026 23:03:47 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181433sm8341825ad.29.2026.11.17.23.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:03:46 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:01:46 +0800
Subject: [PATCH 4/4] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
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
Message-Id: <20261118-fix-tracenoc-probe-v1-4-0298dc5f05ac@oss.qualcomm.com>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985401; l=1737;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=mkChMr5QJ/I0Rmy95rl3BK7GGoBPcuQy2FyYA5pTSnM=;
 b=Bs0qa1GAKffiP3TzUW1yvs8s3AtA3FM3Teo4ZoHZqa3aWneuzLoi+acavijCagjS60VI3FNG6
 cbJ/3P1xwDvCdDipCwe98kdwXeJ5/P9mnqV+1mZ//dZpPW7Ja6K4VmE
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd4dd4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VopqNUcg1dr8wGNk0jsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: m6orf22rgP_bTJYrRIhhabuLPKy523mg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX0oItehqBbq/i
 0ysRBKJsi6lTZMvj5fyTD7j8W0tRW/8QNgf5Xjgq/Y2xZB4cAUH4FWrs3gjUaK/EB+c1SUoSK1C
 4N/9oHfejs2wy0vlOPwJklNqwICrQX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX9oGE0bFtdlqQ
 YhFyk8xWEtIDFBOJ5cI7fgn9n34+qNgHe7qgYEuUgM87a/dRXmPThLdNP1DOwJ/+MhIomk5E20A
 vRlZHcpQVnnhgerTGB50uPnH7NF+dXLbGnTdbhouh9F22lYCJKkKnX64bR+o7eyv11hL/elG9TI
 6kIIjG2Z5cGOOscNOYVsi4jw9UQWRkQJ42mDslLAO0hnczn62pBRNhHkjwvzprI+4actt34RRmi
 ESbTgGS5C8p96SzJQay8EmA4ETSZ/ytK8vvfjzp8k33VS8zvnOQ5e/KpFWRcblnrRCBJVZ3u/Eq
 Gt2r1d4x6I09ZUee5k61+nL1aSHy5rngT1p0GuyNJ5WypnJdnjNm7bq3s7vV3G2JWCRs+PEc+m7
 R/E8gxa5mt2JDq1oNFUU1GI8bHga0uAr8OpK+/Ky5V6QxgM1hlo3QqC7pLQmXFJqWwyFzsysvvg
 kN6XlevfyoaB+J8ZRpw==
X-Proofpoint-ORIG-GUID: m6orf22rgP_bTJYrRIhhabuLPKy523mg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It was marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
an ATID. As a result the aggregator had no trace ID and could not tag the
merged trace.

Switch the node to "qcom,coresight-tnoc", "arm,primecell" so it is
described as the Aggregator TNOC it is and is assigned a system trace ID.
Rename the node to "tn" and use the "apb_pclk" clock name as required by
the Aggregator TNOC binding.

The Component ID returned by the hardware is 0x00000000 instead of a
valid AMBA Component ID, which would make the AMBA probe fail, so also add
the "arm,primecell-periphid" property to have the AMBA bus use the
specified peripheral ID instead of reading it from the device.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 165dfa11f17f..323207989d25 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -7389,12 +7389,14 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000 {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-tnoc", "arm,primecell";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
+
+			arm,primecell-periphid = <0x000f0c00>;
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1

