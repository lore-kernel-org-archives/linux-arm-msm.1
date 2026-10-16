Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0453E45C709
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141589; cv=none; b=gCuy+F2jVOTG9lBQkQcN+qkSNOz+aDj39lOY2IgJR1bk3HPLlEIZC6mSB+C9Ftwd+cizVHNEQ/wR9P8ygT8pIV8kOYrtzfa8aDOoFSee3HepK7qWVYSs3j1DMNbIPMQFD8oZcCdZWrRjgJf6Lfqr3o50I89Fo3uiSDUsFISvPX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141589; c=relaxed/simple;
	bh=LEjiLApMQqTHDDtk9CHKJXxbNV7MEotxA1g5DsDCPLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=li3o61sZNo55UGioZbTZbfC+8YKQaAIpOyjnjmfFHjHBLSVdPnDNbrHuXt07rpgFJKB5tWZ1qSFVnh+Lnw6DERnUnQsJ1FXslgWSUYvOHrrFDgs79XJr8PE1454NB0kHpOsaFgJadh0mnhDNLYzmAFEkQQW01FlqdcPv6OHybwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cC2HB+hA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqO6HD8C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cC2HB+hA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqO6HD8C"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m48q1465281
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MiRPL2ULAV5NkriOUKUnMN3bqwjMHXjIke9axrwz75I=; b=cC2HB+hALCM8sxdt
	RXlFasSkFUqTXT8xluv1dXjSH1LHhiGvCQzZ1Gp9W7cKmuG28jiU77b5LvB6IM0n
	yOfgoztJbOwJQ6oAfOcEhrDaGXMn6MBfbmbhi+d7OxcblTRWhVsMbWYnDh4PemIj
	ztC+csKZtcxniNpqVIYyC0OEpEDKNAvNOTclXi/fwvL2YT6wrb4gQwAEwsqjw1U/
	FXVzF4Bp/YOAnJEdMdJi4mP0t5+q78STQCLTmR/kxLmbnE8dfxkMg+Wl46imYQLJ
	oFg2vk7veheO7PboBWCPrmBdJ2zQLSQIacotPBjFl58XaeAx9sabSISENXC/e2Yu
	3WQRnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wufxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:06:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cac495d99so49228085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 02:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141584; x=1792746384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MiRPL2ULAV5NkriOUKUnMN3bqwjMHXjIke9axrwz75I=;
        b=HqO6HD8C9FO/YHTIq33bQPSLqlWpe0bXbw0agPHsGcHpTNZOldFh+gqmWvht9P6XSs
         SuDbkrmYzXScZk7TKY6PYA7/Rgx50xjSIOcwaiyyveSUNJSOZYPApY5VRp54Q24L9aye
         scAsndDxo/zNu4QEvLOdg/FiuT26IEhSqV/pPNQQEj/z2efdcGAnwi9WMBtL4gnTNfps
         PIEmOpDX86SV6dyGKUu3o8zd/JGkufHKO6+/Z/5j06wi9CeGtSEW1up1uvlQo7SPGhC1
         F+jqP1W1L/PU0I/waLiwkfljyCa+2ilURw7KS2bfGq8fQjxOPl9ySFVFYxkMz4i2uDUX
         ZIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141584; x=1792746384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MiRPL2ULAV5NkriOUKUnMN3bqwjMHXjIke9axrwz75I=;
        b=JQl4adS9Bw7BoYtE12O6dEY8SyMizO4yHm8vrtIZMz4ubPgxfC5weRRPa1ecJtR21u
         Vc2zzZ54qSoB4hDsTAWrqS7/+R+9tHsjjqihbPVsFcaU99jlepomYvsS2+CRxFfpol8m
         i6F0yiCC0tjTwKlqpOUL31Tk0mHzFaeKF5m1ecj1ZFgCNGQZxcpcrGuEbqwas1AnIUe9
         BBELb4eybsHEKInYrT1C7MX2Pz5yByfdURl/WVcbci6mSMv2h9fiZqgMxMEdsqlicXuo
         5DdRniLHxuCkG6JMv8dkMvJxwWdsKBfb9CDLPgU6MMN0FAgiUh+OVmeF3wUQuYnO0XaZ
         O7Hg==
X-Gm-Message-State: AFq9FYJenizmdJjqckdf1fGpVRB1NG7BFsTTSzGj8j97lFf4Qcdft3DB
	4CFca68yRf5olNFnBMskadNNrWH3J5qhJPX0gQtaZv6I9DkDbfPzlVx/QHf210zhJz/gX/BbyVN
	OUcaGR/fZcOtq//o6SdUn42w9Bxz+vMImQCTA6Zsi4lv+O1mbpEslqKMgWUSJLwy+sZtB
X-Gm-Gg: AYBFou2rgOukJ7dYQsLfJGbt/jG56ve8c74wclAK1y+Wrd2Abukz7O24u56awKuKY+i
	7DGQFhZT6j5AKJw13/PBbST9hLN7yqKtLlutN+rVC+kb0d28nyruR8LgRIgWhhc7oV1wZSP0V9r
	p5gk0ZnSI47X6yzqbsvfQle5SzFfr1HC8fIRYxPG9zK/d6a+A5WYFjIWP3IjINFSTf10PGW+v28
	nZidPYa7HSHxgJPVMy4tulzSZufZFkrNxK5rrNIKlB68EgB9wPMFtjKgYLM3sSyqv9Yy2kJXurm
	xbBG2Ip2bwY1qtCa/FXb/X9NZ1KBSajdfQb/OSLLBDNJSyqW1FlSzUE5rOeNUWRbqXEPOTQuDEV
	7RQMsEv/DRGZx3WgWs0v1xA==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr3711720285a.0.1792141584198;
        Fri, 16 Oct 2026 02:06:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr3711717485a.0.1792141583729;
        Fri, 16 Oct 2026 02:06:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefd4sm52320466b.35.2026.10.16.02.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:06:22 -0700 (PDT)
Message-ID: <d6c92920-6258-4740-a151-e6512ee8c610@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:06:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-ipq5018: drop CLK_SET_RATE_PARENT from
 UBI0 NoC branches
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261002121920.994608-1-me@andrei-z.com>
 <20261002121920.994608-3-me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002121920.994608-3-me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 85hEom1f4wcajTcWvSStDetJ9LlzFc_V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfXwkvsctA5GK2M
 NsBltUhvLyhlp+BKlHr2IdPW0pTcewvMNT8dWFje1D6JC0kXxTBFfJkgrLAKRxO8J0hBkXK6Mqf
 k4uFcZnn706PmB/DUsragL3vW8ynJ2S0dz4uPFGiuhEc0zUObGBUXT1JXuySXZJN4ni/MLM+lXy
 2wBKFnHUOYfJL6bzKk7Y1K1ZUTslezMg4RxDDWC1o/kMtp0yAMTrW4TGR3dHOn/GnzN4NyxD4Jt
 D+EtlIpVXhoMxzuY94PUcdVovNatx8HFKZHJw/hNgYeWUvZsRvMAT58A6zD+ASRNK2n9PO7pT8E
 GVdhc+PoDUw6vtxPAxGUfpSXuZQSjmPCLMqBg4i6LE04G5jqZ6su9zIeF3yp8rUd6bwIgIgFZ4d
 yk5+3M4KvMBJllqsgWFpyymPDAddAvdp2HzM+dVOYpHw2d1MHHBQUPoVo2vGqNESaeLT5T1uXH4
 NWB0UaXO1IMSArNH3uQ==
X-Proofpoint-GUID: 85hEom1f4wcajTcWvSStDetJ9LlzFc_V
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1e910 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=J72pobsmAAAA:8 a=EUspDBNiAAAA:8 a=KYwysSycBQfcZMiHb78A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=CEj32ImPKXYnrW9rpEIO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX45ES9FQvGpd5
 Oevalzdzh1HYV4hr1hR3b72h+QmR2FtUcLpCspZYv9BIgkYoN356z3Ir090KmaeB5pU484Y+Gfj
 z6JjALbV7rZZ6iU62iea92NJs2SalrM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160036

On 10/2/26 2:19 PM, Andrei-Alexandru Bleortu wrote:
> gcc_ubi0_cfg_clk is a child of pcnoc_clk_src, and gcc_ubi0_utcm_clk and
> gcc_ubi0_nc_axi_clk are children of system_noc_clk_src. All three have
> CLK_SET_RATE_PARENT, so a rate request on one of these leaf gates
> reprograms the live NoC clock sources that every other peripheral on
> the bus runs from.
> 
> Each NoC has a single rate anyway, so drop the flag and let these gates
> follow the bus instead of setting it.
> 
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> 
> Assisted-by: LLM
> Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
