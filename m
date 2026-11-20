Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182233;
	b=inonikimRYUnE11JYyA0bIynneLX0Bb4DE4na1DzNIghri3Dsap8YN1LRct64J9daPGJ
	 QFzgtKpYpF7Z3gETI3S54blOH7f4AQvEBZBc8Wa0YvPqCmgy1Vs1RCRLAB361vo0E09qQ
	 qYxL1GR9HwXunAjwDy24qOmg/2hZpYbE4p9Bx2WP3gVyr/ol22/h10H9yWE4GAnpCqpeM
	 HGLQSADd75NFAG6H77oBjZQvqGp123fbiNuo2gFlsf9qeBmRFcRSEPFVlv5Yp6nWPqIjU
	 GuSQsAdiDgQLz3Hx5vtzlwHbrD6hxZVpZxZy0n2i5+2Kd3D0rlkuft8hTwCwln/5AWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182233;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
	b=m68tkQqhIZAvlp3c3vvpia5Y/vAs5ilGcC3SnslVgJMHzR1cYjwlbJFUaw/NeMX3Y1Ok
	 W+lg5XtbE3X6DdEKsJkgO+uJwYEQN80pSv8EEf9lbLeeVwN8zDv70UPtIXVgEdp8Y9cTR
	 IJmjGOuO9jPCXwCTdd6lMnbbmbXMS22VflyU85wHYlChnXunfFEiSZ9uHRRu8+gokESqh
	 b7lSXiI8cI1Txq4a7TqeRbXsC7Y/+vKIxVhDlsLGnAGj7bTlKTxRoOD/ISbFWL2M5u6Q4
	 XEZMUiiXI/jwN26WKlZllVbQO9fU7/JKyWEK993HdrPjQdORbxmQQPxoycCo/Im/OwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=clk3TyRx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bfE9cOiP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A3D606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5A3D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=clk3TyRx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bfE9cOiP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkJAO1017203
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=; b=clk3TyRxsqGpmwKH
	lXFfHJxGFKAo+2t1b7eu0FhmFz8UU5VLD0pn0BT5PwOd2Su68D3lc4U1WMgdM3pC
	TXHincv92LJJFagvBU3qxroJpby2qbjx3xHsqWhtYE1JLn4ReJGTWF+UIDUP04R/
	faja1vhBDAakHwDXpepD88lWuevZi3lTmylUyxCBpqFHm54oIHDKWTTOs2R1ffcl
	ydKhBgnJVZuNfYtM3VCStl7C5f/gI63pR0/hzVaw4gI5K7IrxkyykCE6QqaDUpDW
	yYSJzAM91z2nrVPn24bTgOOCGw5ZnYgV/fVPZtcrfOu3tVWzmeE7lIyw3OBKc4pf
	1akSlw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqst72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38131260a5dso2341490eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182232; x=1795787032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=bfE9cOiPTWNTjRt5aiqNOp2uXhuBgGwY8rbEqFQeu8nHfAAYMoIZxiLHCEc/9ScQEb
         g5qy6sDRQ43CS0hixCDk8/nMuCkgMcEUzhFWB5JgHKF2B6lZWL3vhIREHEmkkpY/lGTy
         sfJkrv87EkPoTRBwmI58Xbi1oFFnElhyfSIt47u+DxW6Ol0TsWuKPOYOLxr59X94xpVS
         0OqrdPTQGEXdczMfYEQVBla8ke0NCfZ1hfWoKHm+F5zQ5hhIpET48Te6vzV2hLBEFSvT
         Zhs6kDFDO4CWcEKfd7XOdw1hxaLhzpGaQCfRPjN6Hwdh6gcZOJ2ZHoX/oaUSek2NWsGn
         t1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182232; x=1795787032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=KXM9PtjQvfaBgxgRLDPpEwl4r80IXDRa4O56qxk9y+NFlgPO06eJ3G7F5wUFNNbjB/
         x/9hUFUJw1O7w/QNpeJI4k1xfuLTaF13KdxNCMyWwPOsEs0isH72DtVNLyXezwf3ONEO
         tvZGHQok50OTff4CJgRc3pQUwc3G5Ok4ZMl3D1vBQ9DyVRhvcD7iEoJT3OrLoKUSZIND
         DDF6NnuM9mRASC4mYRRV1OxmGcg1b5onqu2YAqpA6gWVrxCx4pfs9iN3Xms0W5EUJuUG
         uD7a2g/0gOwfLt1k7+XNanTV9EH9PqauHpxYjKKFeGCysMMafydUsUoa5x6DyYpOTygI
         QQGg==
X-Forwarded-Encrypted: i=1; AL+hErEsHg5seK5yM6MZPe04r93lyZl/Jy6ufdJG5VQcag4CqFP7yrLrS8kal/h2VVFQGt3aNmHzvMJ+mlzsqliN@vger.kernel.org
X-Gm-Message-State: APuU4Z9xvoXjwk+tuS5tQZvuhLMz8lX0g/9q3gfVZ3B4Tcu4hDQjpMyg
	dlftu0H8L1PMQKxrHhTH1TjmdOj4oxybCbsKjVa9zxkp2mz2F1rtR3sNKAf3dHOLxfKBKAN6lQP
	oLtBKs5H6Qnzp0cju56yO09uhiF04Z+/OmqVeB6Kz8DhW29laRAwBkE6m0I01zWjkp3Eos30Te4
	oY
X-Gm-Gg: AZFdTZf1wuSncUBYegAw4JTJzTeXOwQPvYtuLiGdjP9UM47cxF5714OLx0Y4NfvQ91c
	VG1XItJODhmIbjksiGHxShLBIn/St0+HVa6hnHvXDJ2LCkSrCl74HWOzAJNXU1cld1Gx4kQ9fq7
	EdoTMhqqzTkiE2xO2EYkU3odKXXOqv+YrIj5ztmg0eBxB4Id85gNi7PZhRcvqz9RVWbMS0G1BaK
	nhPAwp54KFuwKCN9N64/poujx7dLa1GwnpDIp9uqLwdTFL2l45ZjxhxolQQ/vLtk5JVRFKkZwb7
	ZnieLC8RZgXj0Sq3zeeaq73G9kK/6cAElmcJNn9X7Xp6SgelF2l4fhVFPMTSpuVjwpNP8mxVP+G
	R4zyx0pAJApNDZe1Ap4RTTzkrXk3CxmsPlIlThQHfqifrA6prxPUuLnlkOmU0muJ38GVfFuVcrv
	u7wwI=
X-Received: by 2002:a05:7301:f23:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-385707434a6mr3031610eec.41.1795182231729;
        Fri, 20 Nov 2026 05:43:51 -0800 (PST)
X-Received: by 2002:a05:7301:f23:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-385707434a6mr3031568eec.41.1795182231051;
        Fri, 20 Nov 2026 05:43:51 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:50 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:47 +0530
Subject: [PATCH RESEND v4 16/20] arm64: dts: qcom: kaanapali: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-16-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1086;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=VBW+lAkn36GDWfLSpCvNbA+g18nHUbQQFlmvho8wcKk=;
 b=Fm5c9lgr4dbQtZ6J15zj9ArLcVgsoaJbg8eXgfGxClImKansogbJQoCBmf72JtCS7ZdNH5yZU
 9syPd6qmkycAwiyl/Un5MoDMHOeMfsWOs5/rFq2iL1qBF8PoemaXM3b
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXxNlGETmGpJAO
 EyVSzhRDJ5DFnW35v4b29LT7rSuC+NJ3iNDOntSMHxi5sTayqB0wpEvqnFSqBxiMVozZnNRiL1O
 VK1bLrMdamHNovD4i4dGhZ0LZdLERNIDNVm5SDJz14pDzV1j42oyrRUA9G7PJcryLHInMys4QEQ
 qOxV01u3uVMb67sg902p+XYAMHQWaRaQhco8Y3VAncHhAk5y055pV80s5H/Is65azMP8140arA3
 s7NH2Zc7N6ym7Y1LNBPcXvuWnesF4Cc7RAv+IrdefdfxglZJ1JSVrIl/QE3+nvDHV+n7zX1URzU
 vGxlNgutHhsVddObzlh3iTVS35C1aWu2sJWis88/1EVHO3KfLHpwgCoSaNP7aCYN2lkPiaNcqyg
 JpXvnl0N8ERLwt8b9paMuE9IzD/wngin2BEJ72qaQZnQXP2eiAJ9GQo1Ol+L3WCwDVAcHGNByFK
 kRU5MdZomN+qALclfPw==
X-Proofpoint-GUID: SN0prthIBcGTxPF_a6AOyMF9L-bAuduI
X-Proofpoint-ORIG-GUID: SN0prthIBcGTxPF_a6AOyMF9L-bAuduI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX6YGY9lk/GL2g
 qx1K43XreDptJbGO4GmnrX7U5yN1Gz4Mxo4VRcmJi5g3iLLtc/qZNzn08WG1S6xM0jzhqVp+KC8
 thTqSJT6Nuk1qOkQ9QXsYa+O84DYbJQ=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b004e98 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iVAGZxyPhfMzDMBdamgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

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

