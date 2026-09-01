Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C90F45C6FC
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247639; cv=none; b=gWLPXFIyTGFzn+fcCb7XEVZGohdytJeRQTN1A9PCM8bxVQVmd3IMMs9fGaiEG9gv0M9aQl6VTmWr+SR39KO47jPaxql8hPEuYA88rPLkLawgbsO62qjQQBWSH/cgbR186l7qacgPzZ4Embv9AuCcp3L3joNbX7Zg8vucWd1rUsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247639; c=relaxed/simple;
	bh=EZuKdIv8VZa2alHRDBtB94I4whj8cxV2Qt8WI0D4W4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pq1+S4cbXbTg3NOjLKnMaAH9yiODCyJ3nZbuH03SACl5M6efR4qfJkxyXhkIiH6W/MVJG0/odKNbyQ4z6nz3Ea6+4IfhV8RyQG3m+A2+zodp78qcb+8SM8/PeMs4WXd3JWqNzkiKH9RBD2XaMxoApibOwXnn65pH6F7pgXtomPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMTpAOy3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmqcidnL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMTpAOy3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmqcidnL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68178smE2974290
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 07:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RlNTgorqFdWbb9sh7PwevW1a
	EEs2BxXD9JC5uiMMwrY=; b=fMTpAOy3l+hvUMdMiRR9suAv4wTCHf4Eb+roGKsE
	UmaitHSfwawolzy2Y8mY0EwlTKlQbXuWZl2nJy86LT0F+7dt5FX8/m4Uhwor/S1C
	JZB+vwum/d3IlcJue+mdgsEajtWJa6l16jMRBLjdPgDxhpGJDYAOqwFB1qJEuJLk
	dP6/CzcFtc14t+d3f/dDk6VtQcLTj0QQV0mVmCLClyDwOh8x4vhFHwZ0EaPJha0L
	+3Q7yYN8+oU4Mx/82eC2BPEz05jC6iLroY/1tPRRxjKOdzDLKWuFYDaiFFIwPDf9
	I9snk8Z9lyat0FzhRdYW+oqc9jk+vi3S8PkE65vYbZZQ/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu06fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:27:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-933023a5980so918779685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247636; x=1788852436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RlNTgorqFdWbb9sh7PwevW1aEEs2BxXD9JC5uiMMwrY=;
        b=FmqcidnL0WgryklaV/+hpMlLAmCcYE5FKRB/8NcCWoZmo6Npt+xcQ/VFh6HnnmRxDu
         pYufJivMElXWXn52U44ARBgKUMGOQJa3Rgqhti5KZWrYlxXR1C3G3ZlKv4qXK6U1/JwW
         8BNpfDObmFBu1WedVZLTvS5DL+gJ/fNAuIXZ1m9pjXIBm40cK10mw8AOKOiD4Ec25YCe
         uf+qdUmxcgHEw0PzOCpPvIdYU14eRu97vnIBs3gtwr5xUBvdvTMsDBYnJq5PK+u1DN46
         B77QdX84PdcOJLmvanrsFpE4GMSynRUMq/Wr2ODpf0UU8mmnu6RDt9UftbmSjyr4Ekkv
         EACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247636; x=1788852436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlNTgorqFdWbb9sh7PwevW1aEEs2BxXD9JC5uiMMwrY=;
        b=DpRgIj4JMvZXHVRhpXbLYi9e0Oe9BaTZLrTvoeQJDRl2J/MgwyoUy3tFxTsA3557iD
         kIzY0SK4XqhkvAEFTkwV2Lr5VcNsnTMomphb6h1xuzRk47BBklaXhmIf/QJTxBT/6gHm
         hbPp3MM3tam8I3qFAuk2rIzecKus3NsJsS0uOYjRLpdgVlwOFDyUdT1pZ/usZPV8oCZN
         tagrOm2aobXYABo0R6eXZIX8Cuh1/9GZzeA2tCvxg8g2NzmPUkruCOiyXX2KLRsRN3so
         etklO88lwlmjMs1TgPTkE10uaMgJprVj6xGY03o7d5u+ckC3upmuVDFNWyk+f7ExB7Ah
         uxjw==
X-Forwarded-Encrypted: i=1; AHgh+RqN6cKByIlXFkqJ/J15GAPpcK7Ek7tc3BQEtFXwYjC/TXtjulvFr3wGSozsWeuNXL+J8DQeD8scwe4srt+1@vger.kernel.org
X-Gm-Message-State: AFuF++kicRPKYz0KnOLzvZO4vv2t1fpT9evEvUcX7oJ0Cu1TjV9f9lIE
	vTnDwwbdqrrcu9dLZ7hRYUZ0pZgJysEWGTXvZ8qIHZiIPfb4ryUEIKh28werVIfEOnnR2wYvD8D
	xW5+l+dnst7P81+I6swOp/imizxcCwLycEwoK7xM2f2p3IF3H6IpaMfAvzottjUqkPSrT
X-Gm-Gg: AR+sD10vhiW2Bel/JzF+e9t9AJI+H3jvgo4L/PISxNBV4M1VBQCKOMOw1ghY6BfNzTq
	9bvlonhofA1JZ/RHGV93ut7zJbVTU9YWOzVNW8W3R7SH4/b+I1iWUQqmnYT0sR6nrOQ7PcDC/kY
	Be6LxKPdTIe+2L/961ydFcVR9b8/z+qt4JbptVeo4Oby1H8uzY7/DXeZXeCySh2UTbJc/KNZZ1E
	5ZYsT7IegFzR3ce7ExKjgUADAFZXFlgeLaPZIw8StYYQv+GbERH/9LrF0iJYHT+pQPYReuaHgft
	Mp0Fp8UA9/FhUkPt1D0ZIEBBkI11Rrh+A4dI2GRbWfe1wiKjFigswhtvipAHUy9HFEMzRbZHwIT
	dPKDRJxFIlm2BNLY=
X-Received: by 2002:a05:620a:d41:b0:92b:8a7c:f71e with SMTP id af79cd13be357-939137d2438mr3130846885a.15.1788247636009;
        Tue, 01 Sep 2026 00:27:16 -0700 (PDT)
X-Received: by 2002:a05:620a:d41:b0:92b:8a7c:f71e with SMTP id af79cd13be357-939137d2438mr3130840385a.15.1788247635296;
        Tue, 01 Sep 2026 00:27:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c42492sm3509382f8f.1.2026.09.01.00.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:27:14 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:27:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        sushrut.trivedi@oss.qualcomm.com, umang.chheda@oss.qualcomm.com,
        rosh@debian.org, jsandom@axon.com, daniel@riscstar.com,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: monaco-evk-ifp-mezzanine: clean
 up PCI function nodes
Message-ID: <4rua6wavrugknrou3zshg2atjo4iyqrtbhztgtk3de7pu233gd@i36uhg7p2snn>
References: <20260901013654.1343537-1-elder@riscstar.com>
 <20260901013654.1343537-5-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901013654.1343537-5-elder@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfXzsB9GFGMDD8y
 TPkL3guxAIa1b4RrHKEXjAy2ySXaaV1MrimnTRSsR4j4wHExsGI66twiJGPC434OEhFD5VVK7or
 yOnFjLQyn7IE0UqJR7MneI5lOyjpFT5+rHELUkgSyxcdEqZ8iMlXTc6/58Oq0Jhzl3Ekhs2Xhik
 FPQg4eykbOrEtk+Yr2Yp7rDj8a/spc5yVjozG9dOanqtjbRtDm9L/M0+n3pCpW0N5T8SM/5+XyX
 aDT1l6SSsA+FI6lX5CWMgsLpu0T7i+JDESpgGq7nFQst8Y1tyme9LPZ5nP3AehildNNwvq9eYYm
 egHvxnTr8MKlIeJAnlNAXF1AZT+sAm68lU1NqH78tQ9MHQKYrzhaIOzgX5aDrEeMtLDBtg/CN37
 Clhu6sKRIvB5nreN0tQkx8bPftGeHI65rUWLvNsxeD0/5dyqCOmOVNCT2bGvaQAu+3W5ZtOo15i
 t7HoUBzsPu81R2jnq/w==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a967e55 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=lCP5n1hGJ6oGlG14cqkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX3lT5bqguuvo8
 g+LuqqF+TgP1+CayrC51f0O8zBVX7W089kmAKIbU1mue1CoKqApzg1OIgALEOsHRVPpYzkeEmU4
 enNj+9j8UzydH/B+0Q9/i2enzGGJC5M=
X-Proofpoint-ORIG-GUID: mPtDl4sNj_olMtvXhgtyeSw_6xL1WZkV
X-Proofpoint-GUID: mPtDl4sNj_olMtvXhgtyeSw_6xL1WZkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010066

On 26-08-31 20:36:51, Alex Elder wrote:
> The monaco-evk-ifp-mezzanine overlay defines a node representing a
> TC956x chip which contains a PCIe switch and an embedded endpoint
> that implements two PCIe functions.
> 
> The devicetree nodes erroneously include a "pci" device_type property
> for the two PCIe functions.  That property should only be used for a
> PCI device "that implements a PCI bus".  Remove this property for the
> two function nodes.
> 
> In addition, these nodes define #address-cells, #size-cells, and ranges
> properties, which are not normally defined for PCIe endpoints.  Remove
> properties as well; they can be added back once they are actually
> needed/used.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 5a67924d2fc57 ("arm64: dts: qcom: monaco-evk: Add IFP Mezzanine")
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
