Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1939C492E28
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991759; cv=none; b=I0Psw3vH1c1Y2N70yT0cfNVeFBLzh4RooV/O1lyKHQi9syzQBEGg2pWxJUdpfJ2bZlyZNEEwX3kF2by2xIX+0JPYsidleYe67w85GPzaFLR1b7YN6Qr6Wdj8jLlGSVqjNRZxIOlOPF7jDIAElJ6ovqwL2FEL1InbUPFEqWIZymY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991759; c=relaxed/simple;
	bh=QM33p/EnGBtZK0CqjaAx0N/SNwLOCdwqPt4LLx0Q4pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lB0iorJpwa5XEoNFu+0KDTCpzG17Om+eozHUz7Fuczq8jTlViBUhyA+8kjkzMBB8A+E76CKtQcIDzVnAa1Oo25+2czcBqBzEfmzvddSEHdDIM72cECuUWwDO6iyInoSzIVFdJRukD1EYWkQh/sGdM0VRHZFtQ84D9jqTrTLJTKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZvYpOW3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfWDJOHN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZvYpOW3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfWDJOHN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeElH1219020
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pCz5R9OTLvUBi0/Cp+vZu+bb
	lXkEmBIy3X7lCeXp+H8=; b=IZvYpOW3b3TUXtoEnOlI72w2mkb6PBMcLXeDSIep
	fBUu4Tj57G9+cvNXcyN7cc1YNgY6IIwp1iHR9zDGrTe7eHREbE5SA9UxFq2ewtsE
	qBOjHCOtwIYh79nYKgl1MgWH7ufkbpaJLEVshw8thvsHobuMyVEvhpCScIx9tU4A
	9m6VX1ZWBcEus83jhCpw7fNJAgY7uDRbsIbD4emcZdWyXlMO5chuDoWefE6XaFBj
	8JkYU4il+uYP83r0jtxpcc33WYAVWOujGjFkijWb17wAnOFbf5vOa88SHmuAlwni
	TK0OruYlK5W+tOeK/oHyWi+hpFbJF/o16Srjwdh8henXSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01193qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:55:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso469901585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 04:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991756; x=1790596556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pCz5R9OTLvUBi0/Cp+vZu+bblXkEmBIy3X7lCeXp+H8=;
        b=hfWDJOHNb2KKhtiM16HYs/p8sSpoowU7ew/q7W4jwk445BIjQk4LpaUGn6ZX0Nwxg6
         DF1mFs2+WwM2n6scTAspWH7qddWE1SKkkKv4bdamrVbLry9VSyor62zPrXOPCBt2xmQe
         DEjz3A46LlmWUjT+aT3U6q9g64wfCJtjir8bNtAS7oWATd7FoBOfYxrzT2ePNrg991Da
         +18wemGhxD2EmqAsytUIrbWdmgMSmrk/55A5Nt95zUIlf0y+RvfPfSMZGjfDCtycK8K3
         IN3PKVTz6fgKhSGC+ObbuVu7GJgwZXmkSWLXE6Xgp9lhQs0qPij0YE2LJgZRbi3S66Le
         UZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991756; x=1790596556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCz5R9OTLvUBi0/Cp+vZu+bblXkEmBIy3X7lCeXp+H8=;
        b=jyfb5euchjvLPS0bFIvpDcVGc+ctzME2aJDFvQUaGVnkfto9VpWx2LN04QtgeL914V
         +xJb1b6TCzKOftaNQLbFWq69TKxSzBsMzXVuyuc7RT+Byuw2QnwxMl8crWQf5l/kRXji
         8+6M4KEbvnb1MUeFPvIEAFUFVuOFDfQEBBjx74oFKY0bw//2p3FznT+6RknTp/FMvP8q
         EzwU1RtfOP8RlK/zzJ8PuOOUMOXxR6i9A4cp25pszLFPd+z6MD7waDptnE6Rh3yT5UTp
         bXj0lVl5EebdbDeQKyGmS02N5tMO4FIigAAoJia5e+ayF14oQUS4hZXRZuPSJBfzE4YG
         psjg==
X-Forwarded-Encrypted: i=1; AKwUvBwHD7z+BQQP6XuG20hu9FEHtOGKexW6ClZL70eyDu5fpm5XklRmcmnYrK7ylfy+SMQk/xTg2gQIpS/bGheg@vger.kernel.org
X-Gm-Message-State: AFuF++l2A46EH+cTxFmEMjc7a05oipFcQBuQ50ELLYeFmBf7Iz8+njoD
	g25SjdMpb1Ide5c7Fw9cQ3i9gojjjuVdtsuFmMlP8FVQ7ag8rmzDt2J3m59zD6kgDo2XUIXvFV1
	VQKIM9G2Nb6y6gw3EB581VcVMk2G2uAhnm9+H35kgOlmtMhRp9vp3DOZ5LK7GGpututtW
X-Gm-Gg: AYBFou1hC9CQzv7HeHkfzR8oa3dYw10ZI2YQ1zHwwSiAZUnWC2LpqSzhXcDysWlgWsG
	qHczVADw7f6egb7Y9cjzg56MBo6MXICaL/md8TLn6EfJqil8D6SRUws/5kpHVBedPcdet3loRzx
	SMRMfIfq61FWFkF9NA0vFWVRlTC5Tr7DT2X0mD709wG1I7bwvMf0a/k84/gH0mpdKtYrc/l+Kv0
	ZALRu5eFR9F911aQ0OpkdRmqVeTSSwJvZ+xrivbdgkarMFcobuMoV/wQYy5gfxLuVVUrZ6w2/ex
	7kom4edq++1XEaC6nQU0LbIwTwSBnTudODGt6+qHAYw9dPdDMWsQB9H7zbj4fpTZobwfnJCc3CL
	WJlICo3Oak7Gp1yM=
X-Received: by 2002:a05:620a:17ac:b0:939:b482:d474 with SMTP id af79cd13be357-93c15e77468mr17494185a.35.1789991756132;
        Mon, 21 Sep 2026 04:55:56 -0700 (PDT)
X-Received: by 2002:a05:620a:17ac:b0:939:b482:d474 with SMTP id af79cd13be357-93c15e77468mr17489985a.35.1789991755512;
        Mon, 21 Sep 2026 04:55:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487245645cbsm32971631f8f.20.2026.09.21.04.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:55:54 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:55:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 04/11] arm64: dts: qcom: ipq9574: Wire up USB3 PHY PIPE
 clock to GCC
Message-ID: <xac3umbsecmny7sul6zonikbuc7v2wgdoox2suvbpydzpqjdmp@ga4g3umtvjit>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-4-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-4-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-GUID: Sa0CTVyiOhxpcJPZfAM72vDISJ0CpDkD
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab11b4c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h3Rc7G0Mu9zKJFVqRbgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MiBTYWx0ZWRfX8cLPEB82hCkT
 1DNRn8kpP9wuS0Ju0eBcKIMwe38f3/2hlSDDNvGKvxOVbKu5jUq8mKuv2W43mGWgaaM7u7NGHtl
 MC9hFFn/Is0vMqA0nl2g3cxPQ2q3Q9b/QObySyo5oXj0Lm4cbmaTgJmEueJNQMCmP1Zotrx33mx
 N8vo4v9UqxWiSRxPUUD6E14T6M4f9NPeZFPHvycisb87QKc+jPfHScGO0KY/7Z5K/aCAa1xjElW
 SD3DBcmFrHjnvuwyuX0MwFjMkEeAf86AfLVVRcoL6cOzxbFGDa6wFum1OEvl90ShSQMjbMwubuX
 HSODAAUr+vkMaos9Xv4RSbhCqOAvmIcU3LUGZUsxc49u4/F6ZcZP1tJllqyHMiOjde2/p2NUJqq
 4zmWgXlRlEY5k/d8md5Txr4kUD02kuI8vHjlwvg9L7WTeAn6J9Xpzp1qicUqgkcaEXhplyHpcKg
 C3vkYEYNA+u/O3NACGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MiBTYWx0ZWRfX0dwCltH7wiQJ
 yi0qUt7IxLzCyluqTJLzRgkJxCNBa/nVwol/oDmkud6FtDPa78KWRI6VI7Qo2s2+IOG3Z1fqZe3
 55DzzbkbPDBr1Bdh67Q6cSUuh00S5wA=
X-Proofpoint-ORIG-GUID: Sa0CTVyiOhxpcJPZfAM72vDISJ0CpDkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210172

On 26-09-21 11:49:37, Kathiravan Thirumoorthy wrote:
> Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock can
> propagate to the USB controller.
> 
> Cc: stable@vger.kernel.org
> Fixes: a98bfb31f676 ("arm64: dts: qcom: ipq9574: Add USB related nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
