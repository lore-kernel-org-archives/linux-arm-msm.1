Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F6F346AE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 04:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787630463; cv=none; b=rt9rMtCYkNsEEFFThRrNRVF3Qe67R2RRgeqNXP03n6jcFnaKl1+3i+lvEIReSmc0XBtItumu5b/hGnTc82IKfEmrkCCSrq5oNgkYtQWWREBHL7YngbC26dE//Ua5Yd1zKJ0KoTU51VeoukWBVw8C6tJ98U0ydQqIIOQsRIRdfrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787630463; c=relaxed/simple;
	bh=YWl90OOdVCd9KNVgHHy4ovXFe+CNKeFkWuTjHDRfD6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y532P2vI+B4ktU47WKmBqIRzBpoUJiTjwucLmdyn7jc8BHOad66OM+AVMd6MIvuLjCi1Rfk67B5T6sSII5aWegNsD4X5d2gZ9a8J5v53tdEufdsjESnw3APsimUitz8RVmyUYR5PlDJSQ5watnTVUYBEAnnocP3kaqB7seD7LX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIKC2iN1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUzmf28P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIKC2iN1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUzmf28P"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RE2g3632762
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 04:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+XQZtMktBy7ekGjf4/plKpxlv6MDb59qUzxqeoByG0=; b=CIKC2iN1ZReAWWl4
	16vuxGWUUJO4xlufvERdBG5vjw/2gSxGqmXPC3TO7qRE01rxoNS3b0E6F0UWkQ2K
	QckfiY4rR5jXrMqy40XdPryMBVmLBSUaL1UuSGjLWV3KIy/uz/xZtAAgmhlzp45M
	HK6JULyoHkGuMBOxSZabRJxkrGFdjLMMe7TdnLRgD8zBLP2vm4w7v9ancNLyWVLl
	TgxoTUwWMI3dGtzARP2pFInlrRH+smkBhuxm1CGTOAzZXx0kht45IKSJhqTpbV9S
	zVl47i3TaNETzacmw0QpARosk1k2JHFISAAOM+BmBeD6LzEjWK1uqsXsKcydMsBX
	GhzTgg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf4fcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 04:01:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84870e7f498so4327714b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 21:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787630459; x=1788235259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+XQZtMktBy7ekGjf4/plKpxlv6MDb59qUzxqeoByG0=;
        b=YUzmf28PbofztZn+3f0/ELIvx+6cCQcsbwmPEYaPiz6h5VT2Phr665iE0ArPYqKHDO
         w//j1xbT+toYiugC6yEmrZnLVaH4nuRFwAZfmsRlCXYS9hvcgKbszOMK9ZJVUVHWRC84
         QX2nMEX2AMu3R1JKs9aID9ijNMgFuFvuEn4mdNMfp1i7b70HRdzGSzUdzjkeK5FhPCEL
         V9ZBWgGESSVU9tUSgGrsUhy6SoSXtGSNdnKENqhOofkuXYRs52fvi4Dv/zx86nyWAKl9
         S4AsylhRJD8CNh68wLzhEO+hA7loJskQEe5HcGZfTltlXhYb3k8Hiuwp2nWhj4P0vX2P
         l7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787630459; x=1788235259;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+XQZtMktBy7ekGjf4/plKpxlv6MDb59qUzxqeoByG0=;
        b=m8xXrL2IzjpUL09OYsr/v1pXDa0yiw96NZaIx7Rdue9WRZ7hXakSM6r3lZxwT7ERur
         LRH6nCXp7Q2U6IDCEZIJGv8xFnq6aEmkssGRSg6R3s2LQiNN0LPTPVbdKD6zNmw24yoA
         5WrBGDqfpCX+6+BW0pbKhN1LZuyp5WYpVge7A8vzYdj05NpkxFc0s28NeIULTvpdGpy7
         qoW6Qba+KZZPdIPj2DxBA66JJKbLnpmdFyEE01yuK7mK4wXKUUU6SP+nDfuGHk/qUZox
         JxrQ3Z4JaA63R8XeEvquyRN0yJK7Zx6u49KkbTUJ4VUL4qIAuNcc3yqc+hVOA/ZAHyQ1
         lkpw==
X-Forwarded-Encrypted: i=1; AHgh+Roux3laimmJpXfQqlDrn5MHsZ5nlUatOoabtgoo6jK8x3m31GQWK7AtBt3Q0lpkCZLmjvA6zevD88BQ+MIg@vger.kernel.org
X-Gm-Message-State: AFuF++lT9mNFb/s/TCl94UuC8WmP+Xo/G+yg7q+WUL0/pB1LBrDKJ5Er
	1B6B5sDiNkTs9mUAWggZ8x7b43buBDnwHpa1DXkXTiSybaK1ZqoHQjoeI8liGKITsQAqo/Ci14n
	S1ETTTACh1jI30dqv2z4TJK+QEVU/IoioBwEIrMdgQaJ1w7MdfqH5kHH+NJuNjn4+kbqv
X-Gm-Gg: AR+sD13miaWYGbqQKhJdiKVDvt1tvRU5ixDDpwnTY+2b/yR2+oiVAVItMbNs0CXGZSp
	/EQ4F63Hi6CdGxsk8eWUtIWXPcgnB3e1pPK3aSfiZiHWjM/HQRfifkOekILlWxPMitQ66jZQoGZ
	2vZCrhXJew+cQk+Gt2tvXZ11RajT1G1EmhMuKS+geUgC7s51DQKkJ5sItobEFu89WOkBItrOPiz
	oG2AvfTCM6+2gQxAwbBOeSTaDjViDzwLXjyXjgFxDwlP+YaN9CuHEHuzRaYHTgAD1v7jxXY1adD
	E3qRUttRXFjCB2Lq0fCk/K263XXDSqSplI3riJ8WEscisXkSHp5D06Lb0/GLek3OHV0B0i+SxaY
	MENRQD56Gst/jnuMxzTn9OwgnKKLSB8M=
X-Received: by 2002:a05:6a00:4c13:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-8520b98be69mr40252201b3a.8.1787630459250;
        Mon, 24 Aug 2026 21:00:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c13:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-8520b98be69mr40252038b3a.8.1787630458620;
        Mon, 24 Aug 2026 21:00:58 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f1638aesm2534359b3a.57.2026.08.24.21.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 21:00:58 -0700 (PDT)
Message-ID: <17735f83-fd07-4fad-97a3-727cfbeabbcb@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 09:30:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] serial: qcom-geni: Use geni_se_set_rate() for source
 clock configuration
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
 <4e0d636a-7975-4711-8070-6f71957b754e@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <4e0d636a-7975-4711-8070-6f71957b754e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAzMSBTYWx0ZWRfXyyxuSMdYvX1p
 Nw7wQafxclAHrv2llvPcFyBdNH4sC8kFC9DrkQTLFkchKtIjBNJpMqc3a23TjY75AdmJoysKlL0
 mgpbbG1Y7v9wGN5aljsONNWqgXZ0y8E=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8d137c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gztmCChag-4to_nYmxUA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: i8WpEiqK7vZ6S1q-apNMEzlNJi7TXGWo
X-Proofpoint-GUID: i8WpEiqK7vZ6S1q-apNMEzlNJi7TXGWo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAzMSBTYWx0ZWRfX78cwUYdPYe1G
 u8fB6llwQg6/XvIrSVn5VMBgqWoBY+Px1Ehs0+Fv/R4bXnhOUQBKY12VUzx7zG/VdkrfonVB44/
 OMM8V1emORDmYSAjzQoe/PsaSafDbbyy7/H8fuZ6spmhn7mu7XUKpxLjVo5uMqTnxjFfUIX/E9M
 l13jRUX4xbew8QfVnXw22MdVLO+yrY118ZUZhdnQdN/5DufFy7pkQd1XRDn+es4EckI+l9Hn0CW
 0D2vzYoD5wGP/PJqqxRNzQCuQI0tPBcRk5UwgpxE9+53C+oIk78MvP72SB6CNHLcExRF9wHGasS
 l7+CKQCwBpPE8kteyW/ole6AANdLIHTMhFNnEozwRLY01Hw4qqCvsEUuzXRBvCGBFGJCKK7E6qj
 2HNXcPwK/TSb2QhcOceqxNQxR6AgOqf9MInvaCmhIcauEQv9k6dvgGEzd0rPPNB5dHCXIcz8HHb
 MTfI6zjWomERvZy4Raw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250031

HI Konrad,

On 24-08-2026 20:35, Konrad Dybcio wrote:
> On 8/4/26 9:57 PM, Praveen Talari wrote:
>> The driver calls dev_pm_opp_set_rate() directly on uport->dev to apply
>> the computed source clock frequency, and dispatches baud rate handling
>> through a per-variant dev_data->set_rate() callback that either
>> recalculates the clock divider (Linux clock managed path) or selects
>> a performance level via geni_se_set_perf_level() (SA8255P firmware
>> managed path).
> [...]
>
>> +	geni_se_set_rate(&port->se, 0);
> This ends up calling dev_pm_opp_set_rate(0) [i see this is an existing
> bug in geni_se_resources_deactivate()], which removes the power vote,
> but does nothing to the clock (neither set_rate nor disable_unprepare),
> which will crash the platform
>
> Both of these calls (new and existing) should be removed. Clocks will
> be disabled by geni_se_clks_off() in geni_se_resources_deactivate().
>
> Then, we should do dev_pm_set_opp(se->dev, NULL) *after* they are off
> to remove any trailing OPP resources (i.e. icc votes defined in the OPP
> table in our case)
So, if I understand correctly, the expected sequence is:

1. Disable the clocks.

2. Remove the OPP/performance resources.


Thanks,

Praveen Talari

>
> Konrad
