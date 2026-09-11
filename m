Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1413EE1C3
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 17:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148562; cv=none; b=e4wTLTNvTEGBwMkNSW2dn+DS2tnppna3Lsl0lXusIUgzx6FY2NoU5cL2HNkkaW+IRKxEenwG3bzM03oQa7bxyoptAlAJHMKYc1ObV2MZz05YgJB+v8D/nvKbsmeOMFCWnJ2We1KaEqdiVrKbblVw93qKDZsBdbTxHp8j9acsZ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148562; c=relaxed/simple;
	bh=kFHvX+j5xnDFzShZOxxu4wH2RoChAV+8BEcmCcK9z/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQ+VrJpPDAJB6iBK7Rm2pRi2Pwkd28j89zJntzsfrTKrSLcluiVa6puvCOcRofB0bG2UGjLc3tMkh/By/je916biia1MJbgd5k36LRkS+wCMHcETMd/KY70exFFn89WODSByb2Q3g5yiyjEIF9B1Q6BnRo/YoRxkajUjKeOF4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0EXKfWz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPrK8WIV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0EXKfWz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dPrK8WIV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWpwR589780
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 17:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2TFrQqlwMVNl590WEvJJn/aZLgIQNxcVVRNL0lpuOI=; b=C0EXKfWzS5XqIXis
	6Gb1tYFg4M1KyxffOLcLNKXvjcoAWvw3yp0yb0bHg860ixQOqMmr8cG5xhLRQY1Z
	FZl8ALfgs7WNaZYBypXpwx+kB4RUoEUBki1SD5qjE2eRjDdUaKvbBAdfusTjMLsr
	lQki3HL4VVM0qXdZmBSeXMcVvtMZHkx1fIvD3kpSy3kYW5rseeO/O7TK0KtumofM
	JYFvw61fm+R+WWrjLQO+QUQmMSEg2/4oCoiz1TU4vxaw0WZ2oUpJBokNCee/Ikqp
	Iw3mX7jYX9eBbdOhCDCg2rGSuteyJdJbKpeicqGCJDmmxynyDyH9JGoX0Kx7O3Il
	WpwOmA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdrb03s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 17:42:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86ab8302b54so1157464b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789148558; x=1789753358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2TFrQqlwMVNl590WEvJJn/aZLgIQNxcVVRNL0lpuOI=;
        b=dPrK8WIVmiFSKCd0kRicpWestITw7MAu4wgJ2+VQOLUCL32g+ur9JEZVNjLtr1BmRs
         Ljhw6CZt2+pCMIhsmObTOE6NPArfAf0cXhGKFKJLtGI+0zAT1rsNyzSE4Ut3CngyF4sa
         frEhIBlW/vBzHm2/FAr5UW2gAD8M0uCDuodO2sOqJlmqAR8TnPHiBjthiTfBtCTxftMf
         kZbIZsM6oulSNzXFtKIec1ChdvKWR6VhRpEUhUHnelaigAgMrEKYBfoO/PshL8FjXVmI
         AZ6K5Yv5XvFF7NaB1QbitCiTvtQQx0I1GlXE9Z+5d8TtUhdMGdTlr1AtbLOCSGFCSE17
         WffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148558; x=1789753358;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2TFrQqlwMVNl590WEvJJn/aZLgIQNxcVVRNL0lpuOI=;
        b=JjffItS26QjbN0DgW/rT6iTP7BhyUG+K3dC2mFqWn5lXB0a98jBRLuYD6cEEEPuwHL
         r4gi0TvTOGS1YoZa/khcugvuTR82+F6D72WkrLbYL5SfPpu4saSeM3FHP6Nmsq5swB4A
         VRDNA47SJRRA2mg5XZE2XFPQvdm1ZSlFg5nOONrFIBLgzRCEBBsrMKx1c86MgDdBnQUH
         uX+6ca0Hcl2PxlUJrXYKe6yaLY06OYk3RGruuWszfYRXHWJDy3xh0ZmhtbFIXNxbd8sw
         u0tkg/6/jBh1qBFkK+sXsRhOQOEqAq4rqaqlIBncTZ/rW9BsxmRz8SMkMEoljuMbGSKw
         eFWg==
X-Forwarded-Encrypted: i=1; AKwUvBxROQ09o1GNA6ZUxr6uH7ryiYQQ/ZywAGVI5sAHt+IKq6gMaJAQ6yt6qk7qz1J64TRHYWVA9gSRbRiLFMtD@vger.kernel.org
X-Gm-Message-State: AFuF++knlgZ0Nph9/iIGaRmZTCXRMFW4d9cXkfzpSYID7awKBHvO60iH
	v8mIzOIzC7AHMBDhNMU4Rw69IG+X2otYS0uAGXnbxeXoJTsmCBecFIWODchoPEPi2qEP9DUge4a
	fDqdUSaQWQhkOHynAxPE0PT9X5kVZNYBeBBKLhtHoAcOI7ptr531+HmaC7Pfnsewod+bA
X-Gm-Gg: AYBFou3ehFi2K1INO1qW33h7PIctRRJkNI+UxGNrwfGgRLdAHmcFyjy9i+QhTkoPSak
	sYxeRS6k3kuvtz/Xvy7nefTiNJc7H8ilczKVDQqMnipUg3+5MppX8B5eRhw425BuLQJMeCS3dHL
	jSpPIq5py2RxMpfuEKDU+faXEL2uYqvSE4WANYXMQNLb4ECOJZta/j4F7RNz9E1iMGT6ZMcFPHT
	4PibDMMTq8CKOKdWRHPF1gIPp+Lxi4F3o5UDXGi1MAWYm7O2VnNE/v2Cj+AnHkezWss3wWCo3jV
	b4c30HBEMQrNOm2biinjI2ldvBCjS3ipuldYrRIZO1ygrXNQ47aWnqc2etxwGvXFrLB5qJAaYA5
	CDajBWBVHQLwNABuj7MqQux9iATsQCACR
X-Received: by 2002:a05:6a00:4ac6:b0:84e:89a:b8ec with SMTP id d2e1a72fcca58-86b31ef6e46mr7785279b3a.11.1789148557567;
        Fri, 11 Sep 2026 10:42:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:4ac6:b0:84e:89a:b8ec with SMTP id d2e1a72fcca58-86b31ef6e46mr7785156b3a.11.1789148556310;
        Fri, 11 Sep 2026 10:42:36 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.105.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c49d2sm1515413b3a.10.2026.09.11.10.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:42:35 -0700 (PDT)
Message-ID: <e152a20a-c80e-488b-a875-404c916cccd8@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 23:12:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] i2c: qcom-geni: Vote for SE clock rate using OPP
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
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
 <fdfbd73f-8739-4845-ab18-c5f59898e192@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <fdfbd73f-8739-4845-ab18-c5f59898e192@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rd1BkDJL8ijTaR8CNjJwES3zYDlvfvYh
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa43d8e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=KFINdI5Z0390/lZYonNNQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NZ9nq7LxGt4YLS7AZqcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: rd1BkDJL8ijTaR8CNjJwES3zYDlvfvYh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI0OCBTYWx0ZWRfX/goJ/LNe64zi
 Y+bQuL9WQHn+xYsOPg/s5Kw6Pv/jOX+hxSud7rYxWsxYzqu4zbZgtT57q/AFcJrSPwagf9xlnec
 IDKjjewYwv73JRrceiqtsDeOzoWh4SI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI0OCBTYWx0ZWRfXzB5Sidsv41iF
 Yfq6KLxcjM3lusTMKnlonPyTNSjiQbBD38N7zFSanwe9uLgyjTy0RROeOmJE5eISI125Y0QV1eC
 94rIv8xZrdUL3usBXS/bsSbd3ec9xhEeA7kgZm1QlZV6zA4h3GQQdfzsLzcCwpIslOFRz/SPgkN
 /py2aF6NO2ADfz+2qhTlUQLlLma9h3MZQAT4XiTgwi/q04lrulZqBi0J5ETx+CFN6KZs3Oa8OoL
 PER35YmI7cWYRJ1R3wUkGJmhJFTtx8258+2MOdPSmFqMqlZtT3elwy0/sA3Y/QiGlCkZ1KKSEvE
 n4oZQ9MxdlXhSB3qLrt2oNKXokHJsYRLh63rvxy13vBp2o5lr4hC5XGtkADYhFvQjnwbs49npYc
 qL8/Y8RB3OUeyOzPY8OLEUpXQPq1nYy2u1lGg9bXN4AuVIE5QJveSsAKmrkeNvzbeIuN+AfUyJ/
 FNSAsOGdk5FUddyKVOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110248

Hi Konrad,

On 04-09-2026 14:22, Konrad Dybcio wrote:
> On 8/27/26 7:59 PM, Praveen Talari wrote:
>> The I2C driver currently assumes a fixed source clock selection and always
>> programs SE_GENI_CLK_SEL to 0, which is not sufficient when the controller
>> needs to switch between different source clocks.
>>
>> Add the source clock index and frequency to the I2C clock map entries and
>> use them while configuring the controller. Request the required
>> source clock rate through dev_pm_opp_set_rate() and program SE_GENI_CLK_SEL
>> with the matching source index.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> [...]
>
>> +	dev_pm_opp_set_rate(dev, 0);
> This and the below call are unnecessary, rate and enablement/disablement
> of a clock are orthogonal operations
Yes, you are correct.

However, in this case the rate change is primarily
used to satisfy the voltage/performance requirements
associated with the selected source clock frequency
rather than the clock enable/disable state itself.

The runtime PM handling follows the same approach
currently used by the SPI and UART GENI drivers, where
the performance vote is restored during runtime resume
and released during runtime suspend.

Please let me know if I'm overlooking something here.


Thanks,

Praveen Talari

>
> Konrad
>
>> +
>>   	return 0;
>>   }
>>   
>> @@ -1236,6 +1249,12 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>>   	int ret = 0;
>>   	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>>   
>> +	if (gi2c->clk_fld && gi2c->clk_fld->src_clk_freq) {
>> +		ret = dev_pm_opp_set_rate(dev, gi2c->clk_fld->src_clk_freq);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	if (gi2c->dev_data->power_on) {
>>   		ret = gi2c->dev_data->power_on(&gi2c->se);
>>   		if (ret)
>>
