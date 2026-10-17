Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF0F3DCD83
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213129; cv=none; b=Wb1OURDurbyAoRlPVyH4UOvEfersQPMzaDytt31NQQ5nwG96nNEZG4r15ANtmXC+8cvBdeExFzmd3TOPNRThY4M7csWl4iDYvLTeJMqbhHrVi/Q4PHnDrRqzFvMAmcNpaYCjS+HXZaUfndZbJilQGVZUwLkK7pfC50tvJb3jZlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213129; c=relaxed/simple;
	bh=3qS4oD30KOIpnI14tS1ndzMw3Vxps/onCRIRJ9iaB5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFgcm2H6Tka3R0OAyRP0mgQ/jIvzXF9oT3Hwi5glTi6hKJHIu0RMz/wqUQ2XUmVs5nuXMosOqhaFKW5RAxxTKp89uuJF0g74TIXC/JTsdXCdZ4CZJcDVaXxo4LRAUq/Kx4ohyf8I3kR1y9C7qmOmtF3E+fJVW4KM2icOjinKP34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/h0ufaw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJ9AwRqa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/h0ufaw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJ9AwRqa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30sAb3939409
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HWHYeNhquwj
	AsfGbT3Xl2nQfvQrvIUg9UcIKMj3xIQA=; b=Z/h0ufawb9ZTPX/NIkHL/gOcQtJ
	nzGdDJG2R+iFJl8X17T3ad6BtegsqokA9O/m3u8WlOHcSYaUYWh6NgGMmkY+gQJc
	NRpLtjYA0ZSXuGXU42GOQByolp2YxvIlK+1OCndDRLTZwsQXFFwFtHxI3KPlV92t
	TTRndSwYWU+zQ94NrluBOIBNCnc/rByl3OinjH9XowrNNXNQu6RTZBcDNw7P6SDx
	iI//xG/7MEz0g+KblBN2bgG1h/7R+rCOeVfUIH6Tj0gfWSjgu/3Y9OZF2B1GXD24
	8+gtWfpBm4yy6wsUwdS0U7ZRh5Da31kWExzqWuquKfQ6PO8eEVVwrmKtV6A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnrfsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:58:46 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so1947788c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 21:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792213126; x=1792817926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWHYeNhquwjAsfGbT3Xl2nQfvQrvIUg9UcIKMj3xIQA=;
        b=jJ9AwRqaGahM2HCUQh65+XxH32TS3yENLP+89w9ysHbzolE0PRJJ8ZjgsaLK0s1M/6
         l26bgmstWuYwdcG2llYqfPzAYGJVcuiKjp6M08bYsgtdfV0SoS7qUyoOlvoG0l+Hig+Q
         AK/6IjCnWCeHUHfoFS2P2eR5DDdYzKwwFIPVDiQ8yLf3020vhQx3/zsaX5itFwqDfY1g
         qD69JvuhQBMMsTaT2DvNweS33dJFFjknG2mpubV7jeKFk9pW35c1/AMaGHgaz9okvSRH
         Vhc4SOEObvicCHhRyhiJ4nUDkGi15m20QKvtM00arwrQNWnYPxQaGt/+S+0+3pOmb7ba
         wDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213126; x=1792817926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWHYeNhquwjAsfGbT3Xl2nQfvQrvIUg9UcIKMj3xIQA=;
        b=fdL4BEz7HwUUVLMhn9RdQDyAzK1n1seOuxnKE+KAGoTMX0Z4UEem/AouWrcwi70+8G
         7TZhb6T46CELzTbkf/vI+J8QAbULaYK/aNFTHQ0tf722vnqIe25nurYw6wy5c2LSjCIa
         HTkhh7gzPbajrIZqM7IenDUfoxVmAd+0IIcmRHoVtywicJdmwljmtCaID1ozdDL9S7LO
         ZBbxWXqlJLiEUazzTZZWrc2X5MzN+ovYqNmbmbNokUaIM2lYGdFPHjyozYb57q6sd02/
         9XojrybBan7yCr6dhI1B5QMWoGua3HGEuOtEiLqQjiS6EwZowdkhkCCuZur8DoUxm72N
         7Z/Q==
X-Forwarded-Encrypted: i=1; AKwUvBz49l+2CoMBUHCoRTyc+Oip7BR4eptkdZ7Yme3/6UjbY0V96y+ej6GHWcdS9pHAnzt/xKWXGuCJzdS9M+pS@vger.kernel.org
X-Gm-Message-State: AFq9FYIpFSH2E/CbRA23qbS5kTSRl6WvNTp210h9UaX79y5wwKGAdNya
	pGxKeCcHftPJf7hFyBefkA5ECqye03I1RFzCX5/VE2iezUhfT9tGlqtfn8IZkNsO7Q550t95nmL
	Bl/JM970AZlime+hO9lp4T8TdhIfD7skA0DxhUJyRX6On7JDfj+IMy9tnU21xwkdxBcre
X-Gm-Gg: AYBFou2sqWnhsU2mhUPmvm3jtZmlGzHc8u5Baxb7eg8CFpy7zOVB1ivkp11oe+LmdO9
	7Q2a5JHDsNTQK0xNj254HcEptsZpTqFxojgpCxXo1apCV+GoPZwqHH9jhiID3gLbqSTLrJIDcvX
	pcVRteBza8eGfkFT5Ae7Rj2xJlQQbJyCirVwRP88E7zUry9r/Qvun4ReUix2aZCOrQYW2uzvdJB
	XRtQu6jKSd5YvY7iYGdHCKDIMCdcYSXY5RIqunGWVWhW81hPrSs6dY3Y/0Y8pGOJn31Ackq21Tz
	eW7/+xXUQynlaNu08cQ95UvjvVEPEQ9Etb9KCJbAdWhLT4rwQ8MeiieehdKl5f7NMljAocfpj6H
	fbIVm5osgjsB0JQ9Oo7MXR+9IXVJNzBUaDihgL0eRBM7kZI0Z77wfHoJGj8Q=
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr2956089c88.26.1792213125601;
        Fri, 16 Oct 2026 21:58:45 -0700 (PDT)
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr2956041c88.26.1792213125033;
        Fri, 16 Oct 2026 21:58:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm15203817c88.11.2026.10.16.21.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:58:44 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Date: Sat, 17 Oct 2026 12:58:16 +0800
Message-ID: <20261017045817.1506961-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
References: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad30086 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=PKgm7S4WkqlbYhXdoGMA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: xxQ4LrwydlqCICeG2jSaQsm81h7l65Lj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX74FOn0SuSYDm
 QoUknMzce630W7a50FvqbWtVSKMZVDnbIqmKdYGb2T6+vBK7spwnbeBtIiWVaaHnvoJ/+FYGkdf
 s4DglEFJh6PO5fXiFGfbkYKI9oZmqds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX4krpLkZcO4KE
 k6oJDgB2w9H861NjNTZjG6vCBOUuLza4JXltVwpUJTp+fVh73RhLPOe6lCSoNmSW2oXEOKyqKMW
 OSwalr8hnqlT2zuHatNpSUscke/PaRFv+QeJfE7jddasaZSeGdTCm53LCVsQtMUyh0yJl6L/r1c
 xboYsZ9SE+ixEDI7CqtUH0ZpcSlb7gjQs4VORzc/kauxLK0f967RnPCAPlm4dHFAq9n6Vq2fCXe
 hT4gehCwItGZGhQe+/w2MVhS0A4IbbYyEeNIuASBtZMzhRk2oDTdNqacXDlYkwQ07dOAbFl5FaE
 aJZZPMkfY7FRMfk5/1DE16DH9tK2BhE1xEa4YlJjjDPwEDIU9lzlacjhh2AiyUmf+bZpDFa9WaN
 Q7NBb3e1tb54mebblWUehVZOfTzeZ8kMov3SrCb0kmV4h18qMNj7/IghgGLXlhrMhbAZSNoEYfP
 svky93kqjXS1CIED1fA==
X-Proofpoint-ORIG-GUID: xxQ4LrwydlqCICeG2jSaQsm81h7l65Lj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170019

The video clock controller binding describes three clock inputs for
SM8750: the board XO, the active-only board XO and the 32 kHz sleep
clock. The videocc node instead passes the board XO and
GCC_VIDEO_AHB_CLK, which is not an input of the controller.

Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
of this node.

Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc5760..678e6e167bde 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3338,7 +3338,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sm8750-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&bi_tcxo_div2>,
-				 <&gcc GCC_VIDEO_AHB_CLK>;
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
 			required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

