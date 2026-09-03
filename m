Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C17D3B27C1
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 18:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461620; cv=none; b=mIhjgcm0Ua3tfLmLtOmMBw8DLoRRIoRWY8KzA1W/iP2xQ5VzxML6JoA0Y6ibJ1CDvHuLpokpQZcBdb3PkZfWai9A1DegHR8q5LdyVnZ1gxR9xbc1pKBZSK0zc+TWthGVzzCCGBZEwNYtibeaId9wxdi+rBn9foduaNYE1uMqRJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461620; c=relaxed/simple;
	bh=ihOpY57dJ6ptn6bsjW7kDrDeDTlFHOf9bCBC3cquFmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivTpcS4LWNNJgaehFwPe//DSxFulQC6BccbVtbHUe7DxUaW21PHL1CmP40x0Ryi5utYTSjdoTfKi/NWPWInXDzaFzzQDrZj8TXE42XaIf24YSLq9KezX4F4TOaBc0DCZKmkRF7OMwRdzYKna5ncpXLHW2H1rlP6/FKxbROBXiPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exZihVhH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O72fv/RQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exZihVhH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O72fv/RQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683IDSDH1257499
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 18:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y9vi/nZKDsDfSyAIlc9ccf28
	vm4I4bgIpUZPKJ7f4GE=; b=exZihVhHXKE4LPHfdLGiWPX/SAxms5HufyvbTfNP
	mDV/yVYt1FZ7X4be+GDYRSJV2rbfUzWhdAPIezaCFcNXPp0tyPlnXpxIukxZC5nW
	mIXzy6x9HRcL4M46bu5p+cxL3E929ANQVE8FmdDyiJFYZnuGwpjFBptZ/8L6saBV
	Vmxg2dzvF3TnlQFT2vflzXcX/sOUuTEb8L48I/J2DAIyAtGU2FfGTHEO82wCXJLo
	XPve2CjBN6kys2jTmJknRE8TzVG6rgqEqTqyPsupCY6NcJoBo44qHHT+hw27BWLQ
	unz2o5cKbPpt40ute7gjlfoTFQmolj6JiM7qqMsA+Fvu6A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxg5ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 18:53:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so243689a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461611; x=1789066411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y9vi/nZKDsDfSyAIlc9ccf28vm4I4bgIpUZPKJ7f4GE=;
        b=O72fv/RQEHnjqhVFQgE3TsAoZX18wNA1zPeJQ7Jqz+jfC5je0PYY/tZovVSAcn86fN
         1C3RvLdFo9muZuLVRbLrRPve3kX6mjtjlZO1XscITxI0/jUi1Tf1Ek0wE/0fiTS2y/lh
         nNUDEzHISArEBycDTkxZrpt9SQ2VyR3islza54OuXKL+c8O12T05Nfi8X29Av+Bcf84p
         blqGrePublLHZr6qk5DvvX5HdCHItdRj2NyMbsc/z81WmR//hbysigoZizzdcQ+guFO4
         fODgljK4H8bQ9kEhADNSA3bDRnEfGyNt4eynyH5rbYwRN8QkjHk7WFafFEyRdthCce20
         Bj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461611; x=1789066411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9vi/nZKDsDfSyAIlc9ccf28vm4I4bgIpUZPKJ7f4GE=;
        b=o5BUt49qRyksublcx3BiNhJeu2eFdkmD2dot7N1E5msSqKWRNSXkBs+/a3SWKcI1L2
         eLupfnDHnEdLe1VjF19nqMBUrfPyBEjHAL8ZpXLWa1acHvaNIejTgGaLZu6fE/ASQflu
         B9t9T7lMucPsHEx+HXM2YoeGWK9krUFu1yMSqaHbsLmibXKJcrj5ooRZTxWf+A0pyhte
         Tu+eyENrnEuyAXoxlBxjCsXWLONhZGr39moxUVXz1oD7U2pVPqVZNk9WKjEeLduINArU
         rk2MGAqD97kAiom5cgdaOm30qy3a5V9tEmsvh1TxXXCpxdgBJjeyu619gzp8XHpCi0F3
         imhQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0jp7S6ORzxEUS2xeij5k5for2yYTgvwBdCH5LVhcJBELgGroQTQkgq+M66/qXbINmWpkdu6a7fNPkF5N2@vger.kernel.org
X-Gm-Message-State: AFuF++lKLw960GTZ02URclNRVHRjlkXV0hmz0m6B3Q7r+5FAGTMPr/Xp
	oSE4f9LBl3gBtZ0pkLTRis44UWB+cS9q42ceRQ8hPqcNiNwCryqkKGnahw7K5xQz4kNHis2uvdk
	4/XH6Se8LpkoS6YggEjhIKHoyBDbOyRuiM37pQmV6kJT3ng39boWFOil8FKDvuMiA82bT/rceHc
	xu
X-Gm-Gg: AYBFou1CDoqd9psdVDYvxsWQlX0p4VFDeFdNQpmolyJki/ymgEZWaQioDCT+cohJaOd
	WoRNR8yrHQiwnnc3thydwVnSFDbl9B56JXjAXM0tVLvwUKh81podeG7q+dNsgPRD/3VoNTPQAS8
	We5z5Fv6enwJBE4yxlOK7RBgXLZMSmSCwOkvXa7twI3+cvNCdWTQ1g/5jL7y/Mj00sXLZ2TmiWC
	X/Re8u9Xq2XOCX8e4PSgcHWXTus/JatSHWS30nBIwXFaTBn0bGyzEST1QafuYyGl8Cdc3lz15Va
	Mp+CSVRWv0mL4XmtZ3RHB3ARLviv/TVoTMyjG9BrJdHO5NJGMfrqlmCbmlzDF+RZSsZAbsEclJg
	7ctcnS9eMdkyUtw==
X-Received: by 2002:a17:90b:4a8e:b0:398:bbe9:73af with SMTP id 98e67ed59e1d1-39b26107ab5mr820694a91.7.1788461611219;
        Thu, 03 Sep 2026 11:53:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8e:b0:398:bbe9:73af with SMTP id 98e67ed59e1d1-39b26107ab5mr820628a91.7.1788461610790;
        Thu, 03 Sep 2026 11:53:30 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm656611eec.6.2026.09.03.11.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:53:30 -0700 (PDT)
Date: Fri, 4 Sep 2026 00:23:21 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode to
 use DLL bypass
Message-ID: <apnCIWJ0b3i3P6YG@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
 <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
 <ajF6q5eKz92ddqVl@oss.qualcomm.com>
 <apU8Yx08/PJiS9Xw@oss.qualcomm.com>
 <b36109c3-00e5-434e-a9b7-46049b0bff40@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36109c3-00e5-434e-a9b7-46049b0bff40@bootlin.com>
X-Proofpoint-ORIG-GUID: 8Z5MHTGSozwj1uvbiMmmRCyMAjyhRqL2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX1WOOPu6el8sC
 W6zx/LwqBu/GxdWi2Opu3wrhQxuHCPWVpuAdcr+r24OmjiAx7EDQdp1Y6U6NZu6aAbkjnvOKCQp
 HIuTFb0/+K656QWVLTP6Ho104/c1ejI=
X-Proofpoint-GUID: 8Z5MHTGSozwj1uvbiMmmRCyMAjyhRqL2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXy/zZQpvEWcDC
 qBQZSgxaN10VLZ7nbNKgDUdjNnpfB54Z09ZSagWSiRzXdd6K0BwBx4vO7787PyRutB6T1Y7piXE
 6NF7n8cFhw09mYQk3RJAChvfomnQLVdkRjrbj67Kg1zsVB0kRbl1wZK62zjEkteM9077FC2fcjR
 /cQX04XYHPJxPuTOkJ/CYML0GaphnhVjzMcTXgcEgbfOhVmi+HwbsNIW5zx0Rb7k74CoTTNFq2b
 8dbMV+YJ8x8X75NK4nBA1p36nDxTu7cZNywQv1biAbOC4tOkQwWKp366RN0RPhbLXZb08fj7gfg
 jaEVW8lgUBO1rN6wgNqSc/zjnxvN2lmK1gDDq+1F9AUpfAWZayjrUZh82pZld4C+EN8J4mWZR50
 RUaGBzSOji2Ay5BIMB4loXPFGa/ArZ4akeiompR7CjCCYbIeT729eX5ICcQFd+AneNipd8LO1Dg
 dsiP9EAP3KL9y78y+6A==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a99c22b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=jdP34snFAAAA:8 a=bKGmqkx0FprkRVM0NBYA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=jlphF6vWLdwq7oh3TaWq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

Hi Maxim,

On Mon, Aug 31, 2026 at 07:01:04PM +0200, Maxime Chevallier wrote:
> 
> I've been able to get my hands on a qualcomm devkit for ipq8064 :
> 
> Compex WPQ864 6A02, has the IPQ8064 connected to a QCA8337 switch
> through both the ports, one using RGMII (no ID), and one with SGMII.
> 
> The DT is downstream, in OpenWRT :
> 
> https://git.openwrt.org/openwrt/openwrt/tree/target/linux/ipq806x/dts/qcom-ipq8064-ap148.dts#n198
> 
> happy to help in some testing as well if needed, this board is going
> in my CI for stmmac stuff.
> 

That's great. I think this board uses the dwmac-ipq806x driver? It would
be interesting to know if it also does the whole "use RGMII so that the
MAC can manage the delay" thing. While I don't have access to IPQ boards
I will try to figure out what this driver is doing (hopefully I can
track down some documentation about the "NSS_COMMON_CLK_GATE*" registers
it programs.

Nice to hear about your expanding arsenal of stmmac boards :).

	Ayaan
