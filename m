Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6824052DC
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339400; cv=none; b=OpwvAA5W01Fbt5ZAgW9XYWXeqRvbcxgaQCKF1tsnkm40/bOw+8CqRzxWbVpHsIAw+cyqSbIfidFdAuriOEiXQlvSJjFQMeJBgCmrQkPe4bt+ALSbujnMBzfR8OUD2I1cHsJ9fOlmc/o92IMw/zlUO7rJXip5b0pwEtnaTTS99I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339400; c=relaxed/simple;
	bh=Hkd7WTFmIkuhSa1Lj9Ua/wTrqEfFcr8VgdL7VPdGPqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttHXBUBzyQl2lA54yy/wh12LjUQA0Vk3gtKPd2BIJiHl+3ufp9JqN/FvTd3n1MR8qqBOqEBDjFehyOgRanwafLO/XQf4OV55pA5hiZwyNroMPoisAE4RkqdA7NNV7oHvlGH/mBR6QlXfE5zoCCzdjzKbLQQLPDs4DBrJchhXyms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fU4qlX3W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kptNoTJD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fU4qlX3W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kptNoTJD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826Vedc960318
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 08:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/QOK9WvQe6jUV3BBjRVMVi73
	3JCIvhjtwq+YyPWtdNU=; b=fU4qlX3WW28/3oPqaAGLDrVjbf+XxneHLH91r71y
	Vv7W4MEcQAVA3MJoMlATX8IzXpfmdoPI34TckvUDFFL0A8wmv/wgnbUJxb7fKTkw
	QFkesvN9Zx8IKmmF0GoE+j0ZldC2Bn3ko171H74srFf0eG7VXWIvD0cQI5SQyOth
	S48R8SgNZFXZsPJOM1Sx5jhuKcMzS1wVe/Jv8SwAmHEJav9IJdgLSnNoO6PrrUIm
	c0PEmRnGTAVl1dHe8XhP8FCSWVzXkJOulrI2cpj6MhmYiK7S2FvcT/Teey5tCOZS
	3M1YOD2WQpT+xttxY5ydfSeUhLKIZhsACJVcJiJJwF6DSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0u2vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:56:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936708f129aso143634985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 01:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339397; x=1788944197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/QOK9WvQe6jUV3BBjRVMVi733JCIvhjtwq+YyPWtdNU=;
        b=kptNoTJD6QfzRxEvonwqoglenSyPtc2d+U9ox6WzmrDXmaceDUXMyRgFcjh7Vy6C8/
         9J+4fyQaPSs+amVkyRFBI6tj2THXmWqIFRfNnbOBB5zU8cfNEFqJvexCytbg/+zDhFQC
         7mRVhafkjJHtz2SSe160Al06uRivXqY3T1AncpU7pBSNCBlyTxpElK9OZu+8B2iajjSK
         w+T6hq+hUWZ2fXZS+yTprhhuHiZEMtqob6jmJ941mzxgx0oOKBv1JdZTqArQ62Ao+Dek
         MVYP7S15JOJZXE7eXX4aFitdl4F01aQ2bwroDXUm0nntxcFF/zAnN/Wut0U3a7h2EYpR
         8p5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339397; x=1788944197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QOK9WvQe6jUV3BBjRVMVi733JCIvhjtwq+YyPWtdNU=;
        b=WPtJivCW20AtVKmlVbidnUzOnkoriJxh6sVlxVMAUW9rgT9R9+k/TKyDZwlctB/Ftz
         5shF/QnU13OtIO6Kz/C19EduX0P8mKxnFYcmdmuG9VOZvaTWwHXnTg8cK4ZmHVSTrmFL
         999v8CuifxtLXitMj3+dQ1AnhQhC+KLSe2GLrBIwKar54iV7ywqQ1NkgHSD5JeT3mMMG
         SXB1pYa4mT/MzFfmFoZx9Cdagn0XRhDFDdkhZRGr/zzbjSn3yLKhRNLNicVaLD0Lf+3q
         iqtbng1tetsT0MK1Tbp/1W/+zpNEuYcSPjnAUfv6Pj80yDqF78JY1Oe6WVlnGWPUNGlP
         guZA==
X-Forwarded-Encrypted: i=1; AHgh+RoJcnj+mSgM76epV3OGxBSEBZ6nFbVBpzznDrpIKFLdrkBsHvs4KHQyFTwqn8Ygb+iPNtGhqw7rHu9AJ3VJ@vger.kernel.org
X-Gm-Message-State: AFuF++kAi1ka5gwbxvPSsyOkIB18aSwn9vRtcHpPqFYCZoVu7qPNwEb/
	0a/5wZnCBA71YCQiws3zS0+a7H2dgUeqm5aONk1g7tWkgvbBZ01mLJHYRsmdduC5BGNPf5pHpqV
	JRycIndXc2YSYfvQBHPq4tN99uShmaenCQRPuFOTIjF9SLwwruxCdC/JdpvF0jB+LyzKq
X-Gm-Gg: AR+sD123kt3tYd2ow2IpaI2zAqhOruQWVrRlKtzPHj2ypkCwyYwKfRG2tzPOEhv5zgl
	qZSnleIcYbecZtSAHm0RlEl4xxYrhnhMyafdeGO9qVcQJN1oe/yzlJkc6DIC49QhZ4S91lG5R9q
	3TznJuL8ClutalNYX5o+TxGUm1SRkye8WqUNHa71fgKeBL8de++MMvr1OHqYw599zg1k97fkkn0
	FM/NwLIHtU4a9R7NkvBmwLYohZKIZB42Y70vqvRNYJDR9H2DYj4CAinZ84pKB1mc1NqB0lxHgjQ
	UK2oeY4pFDyu0mUJ/fvu++w1hcKTnBXaFPaNHoBubhZjOuuiUIRU9Wzj8gGEFRcJHoD+woMoyxM
	SbOYRDBi3UMCtG/Y=
X-Received: by 2002:a05:620a:bca:b0:92e:535b:e08b with SMTP id af79cd13be357-93960f57dfdmr345527685a.33.1788339397109;
        Wed, 02 Sep 2026 01:56:37 -0700 (PDT)
X-Received: by 2002:a05:620a:bca:b0:92e:535b:e08b with SMTP id af79cd13be357-93960f57dfdmr345497285a.33.1788339392514;
        Wed, 02 Sep 2026 01:56:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80388sm6241821f8f.14.2026.09.02.01.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:56:31 -0700 (PDT)
Date: Wed, 2 Sep 2026 11:56:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        "Dr. David Alan Gilbert" <dave@treblig.org>
Subject: Re: [PATCH 3/5] usb: typec: mux: ps883x: refactor DP altmode
 handling and support TYPEC_DP_STATE_F
Message-ID: <yit5hlvrumamlkp653uleqczt534aabcgrw75q4utxpistsnfv@ctd4lu27fndm>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX+3sEpT9D4HOa
 U9yPblS/0YVS6+2/4CrCpdltReSLFOD3/9HqlGpvorVCipvNkgZVWaLV4SYDCdYFdjlgJGnHnYz
 H3/11StcanxjHjmyfcsbOtebo5uVIm5vxbaMg4Dc0Zi5Zqzh9qgPev18msgQLQ5RxWDLxdV1Rrr
 jgU4q+plFrXqfUEUR7e/7nqFmtWUqyF35k6UAtQSzE9tjVSrQaq/QApTHE4RwJdvEFfVTqA6KYH
 9QugbM/wegdNH3+1CQQHXUQ2ozJBaTGxqaR6Z+wmzVKgXZZopjEizM8R9KkxoLk7OxZ+Bk38aHG
 TzApWsaAdc/MK3jBRhqEsjUriSkQlh0//Sh9zYagy9fI+Ziu7QHS8xc1BB4dzs9YHvP8Jn/zks9
 RA4BBhgE3iEaZrX8flMwBiTu4lYevSr+GrY7aWKJc3asSUwCB1C3DurAfn5LJ0Xcjjqx7D66WTZ
 CgG+jLumMS7/EmeWTaQ==
X-Proofpoint-GUID: kWaO1fjMT9P80dY6rXscW_M796l-6_5M
X-Proofpoint-ORIG-GUID: kWaO1fjMT9P80dY6rXscW_M796l-6_5M
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX7KPw7MCL0rrW
 2R3tEsOPvEjHDm7usayt9M2aPnLtpjMrTGuzUaHEn6HbkIAW6SM8VL2NdDllgJdTZjg3HZ0TwI/
 6Y8JcUk/taZUcATMYg2Tv5miNFnAJuQ=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a97e4c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=Xqxl2qIfDM1Vn1vrR_wA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078

On 26-07-18 19:06:31, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Several docks, including the Lenovo 40B0 and SSK SC220, still send the
> legacy TYPEC_DP_STATE_F mode request (deprecated since DisplayPort Alt
> Mode spec version 1.0b). Treat it as USB3 + DP altmode (same as
> TYPEC_DP_STATE_D) so that DP altmode works correctly, especially on
> the 40B0 in Type-C fallback mode.
> 
> Extract the state handling into ps883x_apply_dp_altmode() (modelled
> after qmp-combo-phy) for consistency.
> 
> Assisted-by: Grok(xAI):4.3
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
