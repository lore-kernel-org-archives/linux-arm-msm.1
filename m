Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18D43FF1B7
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511951; cv=none; b=kn+sWBnra8CJxb9jDrHHyjVc31ulXHD2JOw48FnF3QHsFlGi+Ny5LpdRI/oQq46i6cJ2Z1wV0tXZNCph4sQYVFgrBou7kb1QYVP9IWWdLcoGv65D81+J6ZD8FdpwMh8TOW373gSFslRPbJsDFsSpcg1iE3IT75D10fzgxyYM7Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511951; c=relaxed/simple;
	bh=u8emeScZ1VxCOwdH8jxMxsFHL75wPiRAAT/6Jj7JFYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCC8yiWo9TiOAOWVfXn5PBHWoX7Kph4eLHRhbkpkYgVfO2xUgmxNaldFtU2huNoBvfUFxu4kFtcYcBIBCiZmV+gZNWdnbP6zXKCT0RxQS40DlyTU56KhJGyCM5III7bFwTcidFdofoB8aljRuyZZaCy8vQy7nZdiGbkfkH9UavA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gp9RnXbt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6J/2ngq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gp9RnXbt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6J/2ngq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847n4PW2976861
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 08:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZ/scEjeUFKQEeVzgH7yc5/BjZu/YvnYriZvaWHljSs=; b=gp9RnXbtsidWyTJ8
	cZNY/UT2P0V+NFDYRFzz2J68xJ1rm9JcKlNlnaYAfnnHja5VKKxwyJ/NzOKJbWDW
	g6Ih3xK90ZflwVVd/BOCpP6lJI5WE2QTNagaBs1ysG4Z8GPEOyFBL6WekZmg8czJ
	4syRIeuKE1VJORmbgGnUZKEGX8WLNl9KX+Wmz4/qZuCop3uGZ5qGdPRrN0GoxpR2
	t0KE/S2LpQopgjYYpn9jVhyo4M8kzFxZd64HOQdjBJ8YAJH1peCKEAIo6Di+KW3u
	+QbCWyGj1E/0TriRNcAafN+sGTg5T+o/wLnkxOPTkDGXz2jjQiPKwb5rrK6DM4VU
	Jz3O3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxjsv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 08:52:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93821883e26so17192585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 01:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788511948; x=1789116748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZ/scEjeUFKQEeVzgH7yc5/BjZu/YvnYriZvaWHljSs=;
        b=a6J/2ngqipS9J5NCh6+sgN04+JE4IfBsdSXLB+Srv8SuIBNYWrqGWPkahMb9E/J7eg
         yPn/PxedNk0tXQb4P89otAVm8heYi+J0kZ0vf64370lMAbuvxeDOwLgTGJl5gyK3Kmxu
         dPuLbU+sehTFvNoGaCHzErH5JyyFDkSW89mAGotu8yxRP1bbju8P5vaSXqo8ZXZWvwXq
         /ldcpKPAbs43xHlGypWAcVbk729iP5mPaswCtb4V8Scl6YPeGhEy/DXgnMh7DAQOcGqC
         hCZ8VyR8sVew8EaJaC9XgHCCemqK283D7y7UQyAYQKsti7cASIsQP4LB5fkgkUZ4ceW5
         HwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511948; x=1789116748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZ/scEjeUFKQEeVzgH7yc5/BjZu/YvnYriZvaWHljSs=;
        b=pDlUqIcehMjAiqKEh3Y0kw7ZPg6yfl3lD/Y3qQkGbxZKC3OQYbBOYzRxuYPd5OuJuO
         oIK7ZsIkeR4JSxOBT6M+U3oNiFd+5aLrl4p44S4njgqP5xd5rLGvvCEZvOgaPkuhz3b8
         oAY4ZAWHZ8YCpImTlzysrHufnODQxp4oTAg6pcUgYrY35mOVF46gPEVf650zorRBgxJo
         QIwZcBPIcHHzK3Vs8xpTflHzv8UwxDoIsI3DY0kGVI28eDriCLbl64NrP8knNCkPrL7A
         OQFUrC+FeUnScb5/T7YH3H33qiNQTQJ5XRaDRBkbfcoyTp2V4Mdfjec3G7F2sAC6v6+G
         cEgA==
X-Forwarded-Encrypted: i=1; AKwUvBxzbsnl7BuVnvLEU1LMdYanYG9B+NRsyzEH2SDMCnqyg8WAd1Z9zl16cSE2wiOF3C4Wx1KsXewH7EzMeZQx@vger.kernel.org
X-Gm-Message-State: AFuF++lDTb1CpE17ygpeGEtht96ckX54aJ5GtCZKqPtoMgHmOac2Tq6q
	SrIqMw/lPA87fZM6kqBupnS+WwWiKPPCl6RAnR9z/TsU2pYOTccfMq9EYaZ7d4QCM/db88bYjBX
	jullgNx/pazLOyzALcSNh/Q1kRY/g3kT8nIf8F8jSZsyePgZhJcps91xT9LpnZg9Xk4ES
X-Gm-Gg: AYBFou3+senZv5bfZunLEyvx8cRnKiciOxImC/H/xEW1QPSO/Isytl5b4hSnKL7BLm3
	nI5ESrwn9OKbAGraTQaTQOLtit+JT3wUIc9y1MdD6QlfzWg6pNRZUd8zv/zOOEDcbNDDYtOnXWg
	eovkADsxTGkYRm/5ueLSyyB44fd1jVmOF/siYw1luL9tyjVxs9YMUNxJK73rIAluQjT5T3R4ULx
	K3qPsoUi3wfwEigFNsinE0yv261K0CSjHfn/CYrYsnu80OjGmdEBN0Nu+LuUte32BPxflOzBMd/
	sx6PW54XQmC40QEjNocqDVXC64wv4i+IsLBTgAWGH+guvzlHnAmqWfGpb/nmkXUZFOhAD2OwgyS
	tTdzctaz2kaPk9E1vLZlOkQ==
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr303191685a.1.1788511948006;
        Fri, 04 Sep 2026 01:52:28 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr303188385a.1.1788511947490;
        Fri, 04 Sep 2026 01:52:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8b72sm76908166b.18.2026.09.04.01.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:52:26 -0700 (PDT)
Message-ID: <fdfbd73f-8739-4845-ab18-c5f59898e192@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:52:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] i2c: qcom-geni: Vote for SE clock rate using OPP
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9kmnjvjQLW-uh2ANNOP871VaItQy_I8F
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfX2vDZEZXRMAHY
 w4HHuLl1xQ/exjtTlZTzYQYRzr/IRJfNNK12IShAspafAzKu3xaM6dLdMRlvZARAAgO80DxnyEW
 w+Myitsq2xva9AibnuHH6wm/gX43sPU=
X-Proofpoint-GUID: 9kmnjvjQLW-uh2ANNOP871VaItQy_I8F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfX4EQHlzKWKrX2
 0hjwWe7pUMnK56updAbnX4RG03j9H+qdytv2VFAMwk3aN1q6CglbytgMNnRzpih11CnKtSjscZr
 4NsR+YQ8S7BtVE7EWH+Tr86e09W7ETlePBxm7bHHOI8Ex+FoMokiSfCTgSXO2wuBSSXxzI6NNG4
 l2gIe5Zb4cUoAWPSY6oiJRc1jSyYGuRm9BeNhDQg88ApHnbQW4QCfIneyppH1EPenqRKZ8xcjBV
 eYfSo+85GGu64naSt6mqPZlrQML/IBp2Y/WgsHE6Bvh1f62/S1cGZZjQNM8LdPCKs90zc52h6B/
 XH2eGesMhHDbtJZNY4Wz11kk14hPrRZHiJNYWupqCL7rsaxBexDyxl+osT9ZfvoVOxtQJQgtDuO
 YbKPecJidMESFkW71tXTNiaC0v7f8Q7G38xGpRnCluzuaYQBQ4Y4cTaYd8zYt92o2Hnk4IQ48s1
 DrqA4B9eAffqBeCbB6g==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a9a86cd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=eEzEi8mspgMuG-bTNdcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040081

On 8/27/26 7:59 PM, Praveen Talari wrote:
> The I2C driver currently assumes a fixed source clock selection and always
> programs SE_GENI_CLK_SEL to 0, which is not sufficient when the controller
> needs to switch between different source clocks.
> 
> Add the source clock index and frequency to the I2C clock map entries and
> use them while configuring the controller. Request the required
> source clock rate through dev_pm_opp_set_rate() and program SE_GENI_CLK_SEL
> with the matching source index.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

> +	dev_pm_opp_set_rate(dev, 0);

This and the below call are unnecessary, rate and enablement/disablement
of a clock are orthogonal operations

Konrad

> +
>  	return 0;
>  }
>  
> @@ -1236,6 +1249,12 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>  	int ret = 0;
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
> +	if (gi2c->clk_fld && gi2c->clk_fld->src_clk_freq) {
> +		ret = dev_pm_opp_set_rate(dev, gi2c->clk_fld->src_clk_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (gi2c->dev_data->power_on) {
>  		ret = gi2c->dev_data->power_on(&gi2c->se);
>  		if (ret)
> 
