Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415766;
	b=lihBEZPLtBMP2zWb0utba1ETXQJdrGCx23HKceu0ZKHPHGrTbsMPiizd+MUDCzSQQU5h
	 b7Y60yOMHjCzOZSoiHgw+k6uP9OolxE9BmTfS7Q4ftq9yXVZFAjBq+ouxBwceXlDfU43R
	 5MPU80Bf717WNjtiCIH+mYQwqKjNwraNtQ0PEkoPJNqRQ97FVw+UrE7ZoRApE14hBe2ZD
	 Hphw8dN3j0Usd8ZQnS17G7IiU373wsWCEY98gk6q1U1amJixtEqbW15YuJ6wGV4+BxdDV
	 UnFs0b55GOiuUMTKBhuh7Bl1n6H6Q8a/Bv86Gac9Idgdvrv1s9rSi7nSJyT1jtLar/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8TaySGWxrwzJNf+ca7AfJqo8L2MFxcf4YcqPChaH5EM=;
	b=NnySuu7aei7n4/ENH3vSTIq4o4ojQI4OqSk2FDHQtoXq1k83nuY6z6eqh81j7LfZl/c4
	 QmvK/Sqnhv51Ngk+9JHa3ZddguuycPXULJqB1EmKFDB7tXSb4vLz2YzQY3uxQBFgPcj/C
	 zgwuAYYMLV7gztwCZGpz2Jo0Fd00NjyO+/gY7D3GadpdlRJdbI6LZdkgXPnCkc1PRIjxR
	 CnWZjbwJU0CkNKMzvMqfwIqtx/adksVyKBFemI8QC3XYkSVb4ehTUDMbKoEjXkJRak3s8
	 +TL8o7mOrzFgFFx5wrjdMyz2olAEgnqymp7K1izf8edJkAW4zbkTMuPovmNRrTc9BGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="fM/L7XcL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HlQqVwC0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2897E606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2897E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fM/L7XcL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HlQqVwC0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF06Ta1665620
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8TaySGWxrwzJNf+ca7AfJq
	o8L2MFxcf4YcqPChaH5EM=; b=fM/L7XcLJJ0Ksni0tOAYu70ncd/yoaLJYjV/Ou
	2JF5rc3kG1i6+qthtc2Xi86erT7O8m3GYlkU+rygidAy+uEGCQ5yyi04Yx27eXlL
	Xkb76OYtuteSK5SXT+WaGM0CAfyvnrGh8urPgJ75Lxzn8EvFzFIBNdoO+PuddQeq
	HxQBgs1sZ2TmCRymHMg8BhVrosAywdDTiYR7ZDBxZddmLeTtyDDNJ3FiMUGGNJLt
	ulIqbUA1j09OBQEcy8KS2+sO3rDIbYp/WhYNzwf/3fBkCvWybK/OwjuuTraem5t9
	9hW2Gg+6RGeWEXVQI6dr4wet/ErQyiYtKWEAsRxDypw8as5g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pt991-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:49:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso8092a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794415765; x=1795020565; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8TaySGWxrwzJNf+ca7AfJqo8L2MFxcf4YcqPChaH5EM=;
        b=HlQqVwC0uSdjPa3iMBflsvMaN9W7SU2ncrcl1u3wHk7p2MLWDca+qn6WTFz4jiAPaU
         H7LTst41LvA4MR70ucvmvBM4D/a9KCrsWrrHFavyJflhfaDmF6PGndVvHa/uRmXx+2zt
         EtlliJVdh2jcUrQIHXlo45umrLpo0DoAv9V0SGP1eKjndZ2d7m/HZTGdeemLvKmCYXmN
         Xv9IOqNZj9Gle53O+sqEFSVDlNnQy9HT7lBF9xMxc7oF389DDEBN1O36Jbm2iBXZ3Xao
         Vk3A8fdNmSu77TkQOzGV12DLedzfRm57wg9zU9xG3gsbEJZs+DYe3eCla6s9AVgvZC6G
         SPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415765; x=1795020565;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8TaySGWxrwzJNf+ca7AfJqo8L2MFxcf4YcqPChaH5EM=;
        b=Bhn0pEATRAugosQg8UL6YgIaAHE0L54abVdqnjyszVmVCHdGWVqH7pUO7i6ZcTMpLf
         T3tmGUSArr/LVPu8fRxxXp0X+FfinkDnAuSheZMWvVDVL6ezPi2W911xMLZorWsGV8Aq
         luZnoIeNrHfJxlQz9Rh4qBZ4Q1evDDeKHW54/xvrUuBgBiox0zV//47f6IX0EYCtncUV
         rtfcdnjDZCAAJNIYh7J14eS11dmYHjaG9j+iXqnMry7n97UJxPWvdVZxq4uADBlvfy4r
         A6sivRSCMrNn4GajD3HoQ0pKMCxCSareqQQdrniPsTqSNaGbQOnWcoeGsnNWWsVA/Xl9
         w2Cg==
X-Forwarded-Encrypted: i=1; AL+hErG3XEk7L1rRxpj+uezOuSKooSXlSbZiV2BHpx1jCSY1xgFqvNrYexyqWEyP9JuhJ2ytpFo+xMoblJv87+RE@vger.kernel.org
X-Gm-Message-State: APuU4Z/d8vKmRxTBZqnmacgrcjCNRsdvSYoRDWVUn0p0WH6rNoUlkctA
	Uxwuq8oFaOAmYGvuwrv7TP/41hLcw1+Y3Myul9CUvwi3P8JFqGQa2oxeqqgNHQPEBd4d6QXTxP2
	k6HnRlztDX/EJKa0vRSq3RXL7oYmDU5GBOBLPSXqAXGCSSEaTGpCMRR63QInOGb/4Innh5o1d3c
	7W
X-Gm-Gg: AYBFou1g99AJVXcIiTKyGHb7yP2erZH39jnli6X52JdbG5quGH/jH92LehiTpPI/dQI
	N9tALgUQz4EQCoXXAVQ+u9pmpYVOQosc5ZdtI2BLK9oHqeJWv0lJ8zto6zoJi1a7YjIvTK1me9l
	1kcsjJrnelswf4zcSo1WA4Bw2zukYw+a+8iuzYlZ7JGT02+GdD8lCz1XK9j/Ct6YTe0xN018j0M
	m7KkVL7Tlu2dcyZxeFPhgCKYlhReSwN/PX44kLJjqNyR4pQ+BkIDZktpmyAzXiiOn53OfBzzY4X
	RPCZBciQQYiWwtFG2cq8WL9dfm7LYA8AWJCXZRSYaAlC6LRlZQ8mlvWBsa+9gb/IZjj35LTbPKm
	W9EPcHJqP4AzKhCLOrxqjfLOROHtPzah2dYxCp5JbFapEv/7hDwrO/29v6u1o+lIzXgPMo2bO90
	YABu6y
X-Received: by 2002:a17:90b:4a89:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b197c96f7dmr35248a91.18.1794415764617;
        Wed, 11 Nov 2026 08:49:24 -0800 (PST)
X-Received: by 2002:a17:90b:4a89:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b197c96f7dmr35223a91.18.1794415764073;
        Wed, 11 Nov 2026 08:49:24 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm39691a91.6.2026.11.11.08.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:49:23 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:18:32 +0530
Subject: [PATCH] arm64: dts: qcom: lemans: Remove secure FastRPC context
 bank
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
Message-Id: <20261111-lemanscb10-v1-1-7164700b7be6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF+c9GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINDNSc1NzCtOTjI00LUwTTSxSEo0TzQxtlQCaigoSk3LrAAbFh1bWws
 A9v4NMlwAAAA=
X-Change-ID: 20261111-lemanscb10-85a48ba7a439
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Ling Xu <quic_lxu5@quicinc.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794415758; l=1428;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=+ZsbLm7dKaenF30k+KJrakVPCc+VOnDzs9ty9fvVESY=;
 b=MHTwmLw5qZdKKe6ppLp745ovDpgo/Q7vvHbERt544JKoCUTsRlTM5JQg/E+5GkzaUXBOt9Mls
 Du7Ak8vzMMjCRp9BXf5tJTynd+0wAYV+Eje74w+j85epVaqmv00CJqC
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NiBTYWx0ZWRfX0zB3t/n1xqv0
 qv/KbKDx1OEjJFxspsCNKsjV5kBGryJw7WMwP9Ls+9sAksUITaLde6O5y3DBPJibke77nkmut4O
 FnxrPxUVvS1ImBT7eYiARWZp5EyFKUc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NiBTYWx0ZWRfX9oXoFsngj99K
 tSoZu630aBmnlJqzaq2D+8ySkFGCNYmshcft4YabsnbnnL4Pgy6WNTdu+oFbvRFcMcO8BmCcQPE
 djd1uA/aXc39MH1+sYHDi51NMeENoms17FrRQN1pLdFrJla9vuMl7FLxtgyPITiSvJ+DkInDJ70
 7BCxD/4vcDU/wY9gOL12OK3daPq0eTI5314CEYDslJmEkqnptq/TOJ8F2oMzJlsfTV6Poei2Le2
 wg+r+keKVAvPlb4LhMVmDgNPRjUts/iwzYQbXmqZ+kfs2FoTiKaxQPsEc0T+JqS3s5YFvYF40Td
 WihcdqAjLc+Dpa6VPM1ymMtjKHm/owJK/otqP2zEJwrBgjEd1hSS9zYSVnUU6poyHP7XjPuE166
 s0XIf3YwrPzqustJ7fJzmZ+5tzt64qgQOnGGcwjgnbPFlvah+BRR2uRoamAonKMQE6dbZwxEwUs
 gDPlCGfJVPlx7AnwxcQ==
X-Proofpoint-GUID: 956a4zqro4tPiU1Hzu6fJFaS9BD9P8Ia
X-Proofpoint-ORIG-GUID: 956a4zqro4tPiU1Hzu6fJFaS9BD9P8Ia
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af49c95 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bmayPmC67nidEJ-jaKoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110066

FastRPC context bank 10 is reserved for the secure PD feature available
in downstream. The secure PD feature is not supported upstream and the
context bank must not be used by any other PD.

Using this context bank for a non-secure PD results in an SMMU
non-secure global fault.

Remove the context bank from the upstream device tree to prevent it from
being assigned to an unsupported PD.

Fixes: df54dcb34ff2 ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 20f329c0df75..e298747c06bc 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4668,14 +4668,6 @@ compute-cb@9 {
 						dma-coherent;
 					};
 
-					compute-cb@10 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
-						iommus = <&apps_smmu 0x294a 0x04a0>,
-							 <&apps_smmu 0x298a 0x0400>;
-						dma-coherent;
-					};
-
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <11>;

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261111-lemanscb10-85a48ba7a439

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

