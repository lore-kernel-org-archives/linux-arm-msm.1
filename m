Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172895;
	b=WfNaCbvd9oE8CsLLq/cMyQAjHaptDlIA0gvwhzjH+msP0RdwVLQCzapeC/vudb8z6c9i
	 6/Mpb+bGcYkWDullqC2BhoUBH7KS1O9yRt7lylIv8pnFh0irwCap8TfwZNsK+HQ/tsObj
	 nRhsP/O51r+0uqnuQvwUjNN4LohDCJxzHFxuknZmDraOkd15PkI4nnu3MId7Z2UxwMvso
	 bVFAY5iL/41uxKWKBdgF9nW2ERX+ZSHDLwvUqO+kIK+u1QuqQEFwbGyXUTGnX+SX4Rhfq
	 Diha1SIkoMnA2tO+VPmO74ToLVjxs7XfmRa8lu5XySDldY8R5KHtHZayJZ6VucQHmbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
	b=R2DYgDyvye0Lv45/r94yJPsnYxRReiqE/c0STVfxxA6GxOWgRyggTP/PsUZw0Xskf0hh
	 ntjJLXsnfSt6rFXexIYmMsL2wnsxmBcRo4CS6hORkh18q3jXjkT2hMfNPHnsWd9YSnugI
	 J7X4ZjAvfAMA2CQ0DYFVgp31DWXY+DDI6PaY0Z6J+LjrWK8CAoLzB+JRh8OAxPy2ckvTt
	 k1NhRzMb9WuKtzZ84EPxEQq4Za31rJzb/K0thyq1uUc+fZhEWYVmDtwF84HuCbQK3p8He
	 6NyF4jkY0grHDuGPIV/sS/BhldSWcBC6OwE9tH52CyeMmKmxRANDlWTOKzJWcOamJrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Znk8sWI/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gR6otSh4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D1960A2604
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D1960A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Znk8sWI/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gR6otSh4
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoPM1462862
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=; b=Znk8sWI/Dw/wTngZ
	niNrsQsD7OA3RaAn7WIYdaEwsJv+qgi60YoGMTHMJnAAJyDcSIn7L1oquNF5ObtO
	DXt8BKUE7MRQKhVukiMOxKocV3dYhEaRFMhpfPl23d8JQ2eRe+Eaf6bDTfL/v2HT
	4c7hrHGbH9WXAm2r3urJ7wrhnYJYOOrfpLEfVdr02H+09ebcROjlGBxLI2DCMjVi
	4cFcZINqIMLLC1I1DDILX9K6LsrsoDsY50Qsmcf+MILF0lgUuIa12lkW8Ojd1mbD
	19243BK777MlIdjNJzLRWqL7u+/muGXsVa36TNudyE32aGu/K9hTlykz/PiLicZs
	RTzLPA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah5v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so823484eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172894; x=1795777694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=gR6otSh4qgBqVmGH1cs1XUEMocPzJbIgtL4FrjfO3Hsw8Zd1H1hzwSqgQGFZYJC+X9
         PRAviKZvnY9OlqFts2GehozotgvyDwBBrXJN9rH7Nt591tNOVQa3+CnFb/vceBBd56Lg
         /cXZinad/HuAvkC0vBfTi9tcdS72ZuhiBW15sPLdvSKLMwlp3/EZFKwU7Q9+k+hQT3v5
         DyjFQXwOMIYuOrp6dYa/SRp9mIidAZI08xzCCqIHG7L3oKezsmuijsxYOG6SIAO0dNRE
         YtzUtqH/wJNfSXK8z8ftn5z9Des6yw6aXL8ydxFzCSuET8bdvs2c5Tslm2CDTPGrHnsW
         HuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172894; x=1795777694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=D1Q994MpsEgRU6cu1zTXr02KuJ5XNtnv8ghSK1T6fqyuHLr9+7EQETFdJJEcdWyj16
         WbnQHQFrrCXqkrZD5bUsZ9fZ/MdPOHNCiA6h9XAmU7lg7ZE2a3aZgYShp/csDHvoUxvv
         GAGvJAk7hNNfgABa0L0UQHWzFoVIlyZDyy23DsBBQH0WqpSG2HfveeDPWRLB4roEwor2
         CXItDz5lUta8bSZmjrpdDA8KB7kWl+TRMeeZKQdxTT0u90y8/khqfAbZApWosxIhUST7
         or+iQZZXzvramRPF50cWzhqYUWl52GAyXYt1QHjsODgz94JcLFW39NXUemm9/wbvgkVl
         yGjQ==
X-Forwarded-Encrypted: i=1; AL+hErHRqIWSPo31Ba8zXBQhqp3LZKghQQc11qGbDniaq+jiJP+poXS+52/Q0oKJ8pcOCuB4pep6KZlpFfaJYWqy@vger.kernel.org
X-Gm-Message-State: APuU4Z/TJa/kUVzDPMdyRFVnBfSGatcap02tKyKoRAAwfcL2SZpP9Ga/
	tlqVmM/zzb2iys4sOaAQ/L2dWy7nX6t/Ky8fgi0SVuNAgqTmaAbELRF3yw86HCtkDEY550JJpyF
	GmFsb1WmQ6/Hdo021WY5lkvs/JMnuo5y0U2/0nxbu0go8K3CHGvur2AmPLML9FGq6SCs6
X-Gm-Gg: AZFdTZe7WZrQh+stg0m++uq1Dx7Yq3uPfQbLVlLfium7cEaWQrUXCWyJuoP0OOUkVDl
	I/zBFeWykfk5kU3IeqgpgaJuD30WL4B3tpDdsL9XmhcqUZjoLZfhVLRw0LHdCbAAigjqWn9r8D2
	qNwHsqS7ZONO19lpMpB9Jird2eDRQZtGySTj7qF/kXXzPIWl8ghm0g0ii34/c4O5mzlUEDcutJ0
	IZzBZhwIDn1hqu5ihTl7y+VRhQu1PkUHr3TAb3lS1h/WRsUqi+uhOm6MKfMzrIY6IAth9lvQ2wc
	8/+vpiZ7qO2y5fKfNbuFdcImGauL857SxdnwN7YT7XchGjSm9KfovxS/rHiomYrulgib/RSGtnF
	APdNnuHdTHpK+sqtEfwLpuxKPaTiCvwrsWZ3SDWAmOYT7J2hWFlUKMuE8qSBjdGIdiU+mLIoAUo
	Qn7MXQ
X-Received: by 2002:a05:693c:20ce:10b0:385:ab26:f3ad with SMTP id 5a478bee46e88-385ab26f492mr1852856eec.0.1795172893402;
        Fri, 20 Nov 2026 03:08:13 -0800 (PST)
X-Received: by 2002:a05:693c:20ce:10b0:385:ab26:f3ad with SMTP id 5a478bee46e88-385ab26f492mr1852806eec.0.1795172892688;
        Fri, 20 Nov 2026 03:08:12 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:12 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:57 +0530
Subject: [PATCH v4 16/20] arm64: dts: qcom: kaanapali: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-16-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1086;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=VBW+lAkn36GDWfLSpCvNbA+g18nHUbQQFlmvho8wcKk=;
 b=3u5aWyWWqvX72lbjGg4IOeHiJFq52q50gfyaLIyAg+4JVQf3SFaLJL0WxkzSJ3PimsuLOiRnL
 cT0t8ho6a2oCiyszc8in30bpVfEtvHfZ6d2fNZiaDAJIgqRMW0zW3a3
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX4DhQZGQh5vmR
 QBdMQBqjLJ3N8F4XqpuRkwm7a44KdELa8Z9xj8wTcKL/0cVxjiWbl0t4WTBqsf0v/es6yHtIk6f
 I02DEfVA+BUaUmpgSePQYWGJ7O53Iy+WIc1tJbHIjwQR0GY6S+SJsNkKqprpf/0DQCW2mhaF1v9
 jZ+5tmBSGNTpnNi8DFTceBcqycs4KVX8Ujsd9mhiMnx9NEXmrErIDxgAPVp21SvygUdIOaP4cAO
 1yCYdUHQvcRUGrVJoKX86wMyiaIbXHG4p829LpQHQGoaE4D4PasKesihdPGMQScLXhxfRPH1vhR
 ZhgOVhG0T6lfEESwxCULW8mCk3SJcpUfvh9W0OomzSprlfgWnI1j3jGzLUcYEvuRQiEOIXLhJr6
 4oZs07vM7vHonE/dH8vFeljcVTFH9z7krAY3DVgQkGPrE2p7/Um523epuFJIaikoDvxYKqxjV03
 3w3uYbXVqhEoDerWUIA==
X-Proofpoint-ORIG-GUID: oH4aA9KkkV-pL81VpycNjcuUKN5ASG-8
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b002a1e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iVAGZxyPhfMzDMBdamgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: oH4aA9KkkV-pL81VpycNjcuUKN5ASG-8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX/6NpHi3TIWil
 SSPKDPt5eLjsMFxxl/fB75AqVoP/GI23+aadFs1ELpz2h6K5n04tHvCP9NVgnY9I9fpFhBKi4nK
 Glo5R2CWTtTHJyi8gF6OP8tEkM01340=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On Kaanapali the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9f04a5ad75f2..eccd5451e875 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2997,6 +2997,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		remoteproc_adsp: remoteproc@6800000 {

-- 
2.34.1

