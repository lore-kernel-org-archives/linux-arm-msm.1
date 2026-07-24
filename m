Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77B83D812A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889791; cv=none; b=lseDNM8Z/Bli5tewjyEReEqjXgY9moBVLquWYYlLsSddmosLGMHOYWbiN3aUPTfP4pLhvB/oUYzpLkHy9zT+MrBfYw9knRG3eDSJ3K2t7WMhhBvQIJ7nsEF/1N0s1gse6dSr8mbHP+FNYCn82s4KoTAWf0Q2lxdQHAFutzJBiCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889791; c=relaxed/simple;
	bh=ymoD6iEm1z/xJI4YcIcVqHQ0MwPDuJ/YROe7ck617xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lkjc5oHaK6FTAzjATbexrhHTPUhGVJplfrXuRU7zoh2kN4lN352lmqfK0X+BJgZh4GWpYglS76ydLUN9YRmjlw+ywNZ6wawXvpTOh3wOcxOKfpHmW00XnKA7zyIjAxz6HjfvQZoRMI2OZoJWw2ntTnmzRUpqb/N+BhemORCYAqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ao46Nv2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/QnFpeE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ao46Nv2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/QnFpeE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADqUS2616190
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w1sAHXi8FIKcRx9mk+3wFmxI
	3fR7XvqWW8wBsDYu/vE=; b=ao46Nv2mqgSDjAWisIRHdgg4N5Gw5GBwUndhg1Lf
	95I414lNQGyFBAV2N6KUj+uV4s74GdELl0t3tBfUrpw1/hI9f0HBYWDBX9OI8ZuV
	PQn54IOk3Cs6+8XYEW0E8kgTm9WKEjZfqFsSsoOyeZL8FGphP8SaPQGAWGx5Zqe3
	ufPEdNAWcGwkruyH5nXGcdIi/OpoNUEgylP5AIlP9jTBlkAtRBKtfF/AW3es3m3g
	JGuOt4KhBEbt5ibLNdSYsxhfGRI4Nu0fabZubLSmcDpC+e4zOYzFFSDSzVd3xhxj
	ZVEgugPzptPrZh+LLfK89OqYExCEIRIJ27eUaeqD3TTrvw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw9chg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:43:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccbb61893fso7149405ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889788; x=1785494588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1sAHXi8FIKcRx9mk+3wFmxI3fR7XvqWW8wBsDYu/vE=;
        b=V/QnFpeEL8zbQ0b4OwYy9Ib2dBdJ44qAQnspGXh4S+e1hkhZlk4ERoiklAUp0aa9x/
         gywETPetoI9IiqQId+KGboraOM8/oR1Z9QQ2rwfuw2FBmOpawukAEqfiQn6lxr3YwIcz
         rIiIhUjTtV8UB06VUYS55/YJqe1QlzD1t8bTVjsjqEe/lWxaFeTkQoYf8VqU56dzjyNj
         k1uwNJcl7Yu0TistNr7utHZ7sE+qaivRUzrBchf7ma9O7mAFBVN0GkVUmDJna+3X7OwQ
         v3M660MeId10xLr9fqQHrEuUDoSqg6Eb4oQ1WaqZmrVefn1B/JGNUAv1otPdqz6Y99EH
         /9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889788; x=1785494588;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1sAHXi8FIKcRx9mk+3wFmxI3fR7XvqWW8wBsDYu/vE=;
        b=IY5z1oPJ+DQrN5HODPJsfaUJ1piMY8Zb/QJLI8PPYtbrAQ0xXQoGyimOhXFoUvmrzb
         A12aYe5gwUAoG7QZZQAhdISppBu9joQl7ujB7UMV5aINazIfH7vlNrJ95r86YBGwitLG
         cTMyAjsOFbf+q3JhzfQ5w8JsQuztw9sWBQdQr6ZDLEuL60porPieYWE8JxfRIww4+T7x
         GwwSkrpGedmQSIL9zT5GQSrmGtSzlZ4R7WvltaQHV8Z0Q5WvUJ2oC0SNk747uKmNpddz
         QQCTGkHxiCw5w5fgb7Q/SE5W1i/UhgY/PmHP5WoS8kmRl4rGEgh5XmHwqDuQ1RoCJyfA
         0UdQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro838R66RSVLeOr1Uo9X7WZuo7WayBTd1ZQ+SnFQu/WofnEEKav/n4Jr0TCR7RvPlEPqeisdsQcebnb03tF@vger.kernel.org
X-Gm-Message-State: AOJu0YzcGVZO1RkKUXFrjI24WGW5CMJtarhgXOFeemfix2WgnNYFCqmK
	niKSSs1axIy48XLFB7wLU0wq6UxEHLCEXDFGLNaW8Aq+QycAQP0xoG+AkiZKto2p/lHMwx6AOvb
	YB2jW3M28ZWqQJ8EleYYpMQYzjbYqtVQI3e8bD73SIG6LblHx1SRXX/x90bkaPQQJY9ky
X-Gm-Gg: AR+sD12P243/h7u8qaGOfU44iFIVG9gE6+E80MzYW2cTs6rkt/TUFZOORmn9UWqJcE9
	N6aETHYtE3+3LqTOkGGCjJi3BbLanIRlO0XSnFBclNy7RArCpKROY5yPb/UzXkD0nyqWlH1lgWR
	QLxOne/rE2jobArLQLmAQ/fXtwmX7sN/dkzKNYSNB2vl8wAGhu2p+vMlCSiKy+ZJzRdK+dOEI7f
	b0i3Qr5iXLXqVyV+wqWzVBlNmwun7G3vpuhzXELoAq+ffEUdpwkeI3WH+Ded2SmfRb1bG1FdBDs
	i9Ieyfa+sIyMk6CgSk4cIeXSsQfX6HDSSZB9tJzdWoEpg4Ut7kRRgA6f+s0O7m15dHurM2mLRmp
	fH1rA6YdIYarjY3X5YkCfcHGbBJsZkg==
X-Received: by 2002:a17:903:2ac3:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2cfafe8bc13mr61502895ad.11.1784889787602;
        Fri, 24 Jul 2026 03:43:07 -0700 (PDT)
X-Received: by 2002:a17:903:2ac3:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2cfafe8bc13mr61502715ad.11.1784889787200;
        Fri, 24 Jul 2026 03:43:07 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f386c68sm49003875ad.74.2026.07.24.03.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:43:06 -0700 (PDT)
Date: Fri, 24 Jul 2026 16:13:02 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <gaigrfpfunsqwuxf24uonw4mrkdse4ap3cywi2eg2qdyfgfzsd@hk6zghfqnkty>
References: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
 <20260720-b4-read-rpmh-v5-v5-3-cb93fb95f565@oss.qualcomm.com>
 <da299944-0093-4d1a-b092-f7857b101199@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da299944-0093-4d1a-b092-f7857b101199@sirena.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NyBTYWx0ZWRfX5ciYcPpEj4Zm
 9DrVASV0PR7wI1Z7duZM+9FVeJK6mMMUGwCJ3vQZYZKZDHDssOjLR4ka5jzh9AdAZd/pmt0tkkz
 378mlifFZHRYULUVurmTm2s5CcBp3ntXwIGvngvAHIpz6Q6B9B6iMhsIUvmBWVHSriqCU5OiXgS
 0L9JwcnS5h4oYcf+3sHfIO4Rp9d+ruuHB1fl35rGNcMow/4Xdaa/c8d4dCwmAek7kNeQjhIKecb
 FC0DbOp2oOxoQ2Yyp5so0dLTqkt2pTEx52q+D06odiIlRUb2R1aiqll5T0RVSrmVDmZIMzV0od+
 2ezfD4XaEx21F5VRMj5ayPxjqYFaLpvpxlMp2tfNdU+GcB/Glz11v/7ukPZllSDKRYqtIDNp8pj
 7u5Ww+uGPl0kpaxvsS5fqnJjqbFsf/IAxltU27YRwlGTGbsynIZYT4Ldb6VM9NliaL03K2hGc97
 2sjLS2ok3eTS0rgZkiw==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a6341bc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Ci_LbjHFLAaaU83jS4EA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: jaQCXSYj9RoxqoeWlQCJQ4eaKQQXA7XC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NyBTYWx0ZWRfXyXX19bAn4kXr
 OtOjQ7G9FTrn6FeitnctAnZ5u0gaAd9XNvJqyT47ire33M6XwLWDOMXl2WKxCvjGsWxfcjeyqHc
 SV1hbqBU+qK0OWmFbv4xJvFz1rwGfbw=
X-Proofpoint-GUID: jaQCXSYj9RoxqoeWlQCJQ4eaKQQXA7XC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240097

On Wed, Jul 22, 2026 at 05:46:37PM +0100, Mark Brown wrote:
> On Mon, Jul 20, 2026 at 09:06:40PM +0530, Kamal Wadhwa wrote:
> 
> > Currently, during regulator registration, regulator framework sends an
> > unnecessary `min-microvolts` request for the rpmh-regulator device. This
> > happens because in current design, we do not have a way to readback the
> > voltage settings that was set during the bootloader stage.
> 
> > +static int rpmh_regulator_vrm_get_status(struct regulator_dev *rdev)
> > +{
> > +	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> > +
> > +	return vreg->status;
> > +}
> 
> A get_status() operation should be reading the actual hardware status
> right now, not driver state - this should be reading whatever the value
> is right now.  If the hardware doesn't support this then just don't
> provide the operation.

Actually we are reading from HW what we voted in terms of ENABLE/BYPASS/MODE
and we are combing these in the `rpmh_regulator_determine_initial_status()`
to come up with the `vreg->status`at the time of probe.

but later for every disable/enable/mode write we keep updating the
`vreg->status` as an optimization.

So, shall I read the HW MODE/BYPSS/ENABLE value in every get_status() call?
 OR
just remove the get_status() call and all the logic to calculate it based
MODE/ENABLE/BYPASS hw values in probe as well?

Regards,
Kamal
