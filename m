Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F3537A858
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 17:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148035; cv=none; b=V7/CK1PnJzGLAtujMjHI3sdrkS8z/6Hf/llpIOA9JVzgN39gU3rfIxGZsgIdtnUEXgsFqVIuGDOziQgwDGMAM0GAJ1gxyogNxW5EJRYZFmYLgcYZhkqGEFjCcRHyizDmAqgLKsGXneV9ovfBn4+iXgj3dUy19SaMFsWvtfFfIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148035; c=relaxed/simple;
	bh=EPB9jOzHRtxTVRXGIwA8nn0Paav15K4HqTW5Cby2kBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lw5+cSWAC2Iy2LBLgTFaBv79R1ree4SvTdqj+J2doe5mzkyux6DwMy903OpBa/03XgLYpTghFXS5H/kqobCp0zHOOsO9sB0swDjxEjY10upbktvOYvOdUvL0ni52lDidq3Fpc1Qz3RB+a8Jp3eRnRbp/G89qlo/ab1CDdXOzfMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cc/b+z6x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZdQh8S4O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cc/b+z6x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZdQh8S4O"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWQ2C4119156
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 17:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EPB9jOzHRtxTVRXGIwA8nn0Paav15K4HqTW5Cby2kBM=; b=cc/b+z6x51RqC4LR
	+sEC5aT9eXjCvmigj+mJVB7E4YMABRFH0qxeo8tng4VITpnJtyi2DTEFxcxdHtp+
	Z/TMZKgb7RUG9Ysd6wln2/M0fwunLiU9RH8GMf4K6kHDQmLUR/7HSLe2wMlUh4e7
	bPyyeWzllqme2cw0df9qRe3HWT/mzLgUvbSsapvB5zE/Ayo70PPEWsad+vxBJ9Ex
	DIHlg5TNaU1s4/WSLwdBaOp6LStNMUpL9Te1UJE7n1Xo2VIgdcOi15JY/UXkq1RG
	07kggEPNWEvfgkWR0yN5/brxtxfcss29TeSBJkkhyiAR9Sw7Ow3y2SfJdDbTLFiM
	DbY4wA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmnkmr4rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 17:33:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2253620a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789148027; x=1789752827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPB9jOzHRtxTVRXGIwA8nn0Paav15K4HqTW5Cby2kBM=;
        b=ZdQh8S4ORZu7O5ekv8y3hjYdmyOtf1eONoKDhim+GdJ9vxluas5uu0an0PLTa/EJ9a
         llNJ+8Ky7HJnw11XVWvUBmwpJjsooBIRY/sEkFX4tilwkjt9/3WfXvHpQ/KwwPRtnKbl
         7MYaxn1EU7R+EJSzm1HEsMk9AH/bGjgrRkuGnDycwGvRSR7/lmJmckXGLayCUPicGyb2
         +VusMOL6/shlKbsJLezTccFbvvLF7mJcbvRhEpzkAZqB1gSKn5QP5nhSnz0WZU8gZTYc
         u4LwMNK3MbPTaEhsf/HOkdQror8vI1M4ODA910Z3f8EXBX3jAC82wYblVUN0iGjHUtmI
         F01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148027; x=1789752827;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPB9jOzHRtxTVRXGIwA8nn0Paav15K4HqTW5Cby2kBM=;
        b=k7bcpEq96YFTIpTP4oyAZywwShGftKlJITSWzRxPJTEgxrukKnJrdVzkOr1R++1QHS
         1SyiRQ8M0hTCj5unXHajO1IiJt1PENAiSfBH6wBTKHYwbCcv8WnYjkt3rL/kgGMz23TF
         ncJOvwkWWdUicKNpK+0fk8lMIT1+QteerAP3rqy/vj1q8CKBOIO7IH0RFaDemfxa8jEn
         Y/fHWDNtYHqZJNJ5D68TXGs9799L0eASMYPVlco8Qm9nynSFvLzMpjcxThJ5MC9GCO5g
         UwtndXrr2ggX8EcFHVc7MuqfPlr2ApLGL5CtysW1JPuLGSYYqD1kZolXVmKqPskwd/7J
         cs2A==
X-Forwarded-Encrypted: i=1; AKwUvBzEz/zStyVPAG5kDbhw84RIhj2/9kfTdGboYGWvBBOkRfEJPDbX2cD3+d+KDvkrf0PdV9d4bEdum8GJ7WvL@vger.kernel.org
X-Gm-Message-State: AFuF++ketj2W6POAeVMKahxRhf/cP877LdgxWJk1UGZ0C4bvuossUOjO
	OzLnvnkAB3BGPw9vyB/VfpYsXFuvqSk23DICzq6l1AolKPmQKQDZ35BnrX1HYsw0EumAPaVfLXR
	Vz30sCieCEnMUFd/P5qf0v+HZNCa3tM6tc2iX+p+bVJLse9ubQKOyTZxwecqMjxhz1Hn4
X-Gm-Gg: AYBFou3QOp4siGrhw/LZmoJaLzDKvD1fJVRznStqZ9SJs/xTQ31z9lAmFIlkqqUlQ9S
	CsEvfmfczImQYYOV/Jpt5UXFB6Aax7yxuEMvzigwBGDvQL+tViJPMYNBuauNSj+yvnORwKn/CHm
	Es4hGBYyhdT11hkmtvHmWzIMU6tjaglRSifJVj6ypQ0egynEYgXpqiDjecV/KGvk1UTYiiMiutD
	ychze2YhUY61rP7VQ8Zmcg1t++T+5KgydKbYmnXbneIPprWfOSO3lTOQwUN0jPSMJ+ZeezAzuLp
	c/jybzoEXy9pjpLOVSDfkZHOUoMcudmlNmDFPmZuWcXNm8pZsouM7mzln8/H82igaFbL6wEex2Z
	H52PtCrS7CCzh5HIjzCEOFL0QelnTrOad
X-Received: by 2002:a17:90a:da8f:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39d9bbee490mr8584050a91.2.1789148026771;
        Fri, 11 Sep 2026 10:33:46 -0700 (PDT)
X-Received: by 2002:a17:90a:da8f:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39d9bbee490mr8583885a91.2.1789148024735;
        Fri, 11 Sep 2026 10:33:44 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.105.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98a58d23sm6853266a91.2.2026.09.11.10.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:33:44 -0700 (PDT)
Message-ID: <6c28e672-349c-49cb-892d-ec521b3004bf@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 23:03:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] soc: qcom: geni: Derive SE clock configuration
 from OPP table on SA8255P
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <CAPx+jO9fcvBsxe9yx9oK=0EXmpNwub5ba0a-TGk1WRFaRGsqpA@mail.gmail.com>
 <177884a8-902f-49be-8fcb-b2bec3ec7d6c@oss.qualcomm.com>
 <CAPx+jO8bXn2F3cWz87Ozjrh00E+a_UWBrHeUViTEkTL87JHW9Q@mail.gmail.com>
 <0f5494c7-c3c1-4668-a09f-d8c43d1c58b9@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <0f5494c7-c3c1-4668-a09f-d8c43d1c58b9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI0NSBTYWx0ZWRfXxLeHM4gtINRt
 Vnh2nQ2brDS8H4BBNB+t0hRyJhp3h46m8grUVzhciiujR8uzydplvL+UGROwNm7AQq2FAU7jWM3
 my/A0vYlhv2EbEK3JJgRMnzg2C15xow=
X-Proofpoint-GUID: RVHJ6J23VKT6wCaiT2v-aM7Km3cih8VP
X-Authority-Analysis: v=2.4 cv=N/C8hG9B c=1 sm=1 tr=0 ts=6aa43b7b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=KFINdI5Z0390/lZYonNNQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iiE2cmy92MJpIBaOhi4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: RVHJ6J23VKT6wCaiT2v-aM7Km3cih8VP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI0NSBTYWx0ZWRfX+XFxiIzDx23r
 86q/NVNQoVYn+1cOHdcZGGX6Sz5oVJrXsDNFRPhO+uFAW5u47gMIjEz0vqO9lktxKlyIULDTcxe
 o84Y/rk/B8y8U5wBuaV5dhAgDJvGkd/Bh14NFPfOsxPwSC3fQl2u/NO7VQWEYqYOPDy6EuAC6Hh
 +z/SQAtY+lpYl+S5Z/CzN773BA78lTxh0c600HrhpJheK1uGwBO9LQ+8iI8pfdoSC9n/1neprwV
 EtaDatyohy2K9uy1yO5lvafRxZNdPn6VVKzOQ/5w9daxZdsj39ohr6TIIBt8jSxYY6vhWI3sZfN
 KocR+QgII6qYTWxthhvxtuw3dzNQyOVmHQKdSOmwrH8OVRTnJhME06a9FX+k1vFkicWH6qXChh3
 GDsPtWTn8bXd+aOhk81ORHtzAQxxxFWvWE+A4KqGDg3ryDIpvOj/DQ23kcoenAqp7Y0TDmxqus/
 RLWKhDqjx3/pbxGiE4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110245

Hi Konrad,

On 04-09-2026 14:30, Konrad Dybcio wrote:
> On 9/4/26 9:56 AM, Ulf Hansson wrote:
>> On Tue, Sep 1, 2026 at 6:48 PM Praveen Talari
>> <praveen.talari@oss.qualcomm.com> wrote:
> [...]
>
>> So geni_se_clk_freq_match() is used by two consumer drivers today,
>> drivers/spi/spi-geni-qcom.c and drivers/tty/serial/qcom_geni_serial.c.
>>
>> Beyond the $subject series, there will be even more consumer drivers
>> that call these platform specific functions. As I said above, I don't
>> think this is moving things in the right direction.
>>
>> If this can't be solved with generic frameworks (clocks and OPP),
>> please clarify why so we can figure out a better way forward.
> The way I read it, isn't geni_se_clk_freq_match() more or less
> dev_pm_opp_find_freq_exact() called in a loop with an increasing
> divider?
Currently, geni_se_clk_freq_match() relies on clk_perf_tbl to
determine the source clock index and divider corresponding to
a requested frequency.

On Linux-managed platforms, clk_perf_tbl is populated by
geni_se_clk_tbl_get(), which enumerates the supported source
clock frequencies using clk_round_rate().

int geni_se_clk_freq_match(struct geni_se *se, unsigned long req_freq,
                unsigned int *index, unsigned long *res_freq,
                bool exact)
{
     [...]

     num_clk_levels = geni_se_clk_tbl_get(se, &tbl);
     if (num_clk_levels < 0)
         return num_clk_levels;
     [...]
     best_delta = ULONG_MAX;
     for (i = 0; i < num_clk_levels; i++) {
         divider = DIV_ROUND_UP(tbl[i], req_freq);
         new_delta = req_freq - tbl[i] / divider;
         if (new_delta < best_delta) {
             /* We have a new best! */
             *index = i;
             *res_freq = tbl[i];

             /* If the new best is exact then we're done */
             if (new_delta == 0)
                 return 0;

             /* Record how close we got */
             best_delta = new_delta;
         }
     }

[...]

     return 0;
}

On firmware-managed platforms, clk_perf_tbl is populated from
the performance-domain OPP table during domain attachment,
allowing geni_se_clk_freq_match() to operate on the same source
clock frequency information irrespective of how the underlying
resources are managed.

As a result, the frequency matching logic, including source
clock selection and divider calculation, remains common across
both Linux-managed and firmware-managed configurations, while
only the mechanism used to apply the selected rate differs.

Thanks,

Praveen Talari

>
> Konrad
