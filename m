Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6C13B14D0
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274607; cv=none; b=E6omn18afOAgSIeXbMVISF+k7Qr3U35Qq3ScSQYCMeChrUZrEk4FVzK5ykEsLE3emrQ7p77Tx2FSNUanmqf8Rzi/82yK4jMv3/hRckiOwFswwpQvva1aC2cABs1m5YeHhvFPLx6YuEv2PpzGouzjYmRdtIA2sZWiLXZTgD0yWiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274607; c=relaxed/simple;
	bh=svgdcnksoFZXdXUyv043nr6f7gfTdgpeHWVFjRuJLQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7SmDEYwbQg6vWtxFc2ZnrqGCI/vqkz+jzfZKDlDPZCDsfDYvQUtKy3cqOE4xxeCywpCnI3kcngmS3wAOXEK1ffGavfOPL624b6SrjMI01AeWj0kD6x8uUe5XSeorsw0gxeb49HLlwtlDoUrs7CXN1bVsn9bYNFoba+X7p1cIEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7p9gW9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJOKCX3v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7p9gW9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJOKCX3v"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8Yci2145868
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 14:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	svgdcnksoFZXdXUyv043nr6f7gfTdgpeHWVFjRuJLQw=; b=d7p9gW9WUiCTvvKg
	tZetSrzwUD3izJ59InSy/iBUxtsJ8gTtqz+Ub+E/Oue/qkWo6OGGGe/ckd2/hFKt
	ClfyaKsnAazja405OZGnxIkX1YmO5lnyvZOjp5haNq0P/QlQ+G2tqh2E1DJnXFDq
	rZzd1Ks1th2dCk+3LKOiIBKSJbuNYHMYPjTxyu9q16uFadsMDRYqWiq6bQnA8Vkg
	DTtzfZMhqgyxkeEmhmO1gDNNmsbr40SLe1CByxUEqcT3mezhdA3eMrJVKa9Bphyi
	pPZ4S1sbaHLbbxo3yFWnAQJ0us5BL54fVAAKtglLSsxWoLIhFvw1E1FHPClHiw0v
	rSXnRA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8u916-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 14:56:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec3146553so1181930185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274604; x=1788879404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=svgdcnksoFZXdXUyv043nr6f7gfTdgpeHWVFjRuJLQw=;
        b=YJOKCX3vGHM5BF7PeBzaRXJbFcmGb9IDTKPetig4f9n8wTKsKjSOJS2enJP7AkCdGs
         kSD/DSC3YnVICM988XO/yC9+DAvBhL4goL8VN27CSZITbzxgOABNvxV+hmO1Z3VrYarc
         nVtSxnNuEBkSTpBSgRuB+I13OQVag+xab4j7ki3z4FuNUbFnBUPojqvg2MbnV+DmdvYO
         WTw8EFo8Q66XUdub9m9FEtDroWRWEal5F656RopHuYJyj8L3tGkQYK4FnTSaSZGrl0zh
         mguUovuiY1EzWQEDO2GIsTOvAeir43xOYsYSvZ0obE6fSs+OXcoNLUnpLJFPIFiJA4ii
         cP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274604; x=1788879404;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svgdcnksoFZXdXUyv043nr6f7gfTdgpeHWVFjRuJLQw=;
        b=NTWOjeuHvsASayU6yQFyyhagI2TXEM7bwUTTeIDs2b9Nvfm3qHvU1klMBGzuRqeKVi
         77jcl4O1AifazEbJd2y7/8yikUnPTnJGUwFc5SXBpOJVHwjnV9qigz75WsYX38eAebc2
         1pVZDFEYE9hxRw49wknpfTwz5cvAEXnU4XH5hmU9c6XEQ4Ff2CE7Tgo7FhUcMc5LJgbk
         aoVeOyHWX9g5n5FnjHl4vUSMSotSew3xjumoxgKn4FIloqx4ZiMguSs7yKeD+hY6X5W4
         8y87RdQkapVfvhH17SYWS6filYb7VeDNEFEzVsmT5zosbAFP2tR4pTwBQX6kXWA98clo
         MSUg==
X-Forwarded-Encrypted: i=1; AHgh+RoOKQLdmddTKQ9kI94hPoLW9jyisLsGR5JDX0vfP5ZieFTB3EC0g+9SfmCIfLLJ0vhAgebsmsHIEC8PGvlL@vger.kernel.org
X-Gm-Message-State: AFuF++nr6Txffl7A6PdM18b+DDyHOfgo8TtjAJa5fyASo6GfjKX8W877
	jSwZnQuWXwZ+nq9lIqttWl8tIogLEb3Qp2FvmAfoNHV2WcoBI2lSZpMxtHMtSvAn/iDl+o8B/2x
	E7kjBzOGr0Frh8bxh94UVT3SVwI/WwwX6/s/3EwJt39pne8XPCj1DkMW9xP1BAmLTeifq
X-Gm-Gg: AR+sD13WCMp+jj+/pWx1OPVLwZUxcyzqzw69JcOhJV+V97Kq6tvc9rPaXezz14KAZnH
	Q24hNlH/etJKCciqRrMjHmtcj2oMEf6DNif4m8imLVEsw2s8ahQv9qMqzkgVddBMPLEr8+XftQf
	ZJo0SqHL5SCuDBKvYFRG+ptFMHCL2Qno74A7m6KgHqiu4MSQjN3HkdQVG3jxxRCu39ay21Abmn0
	E7dpjD7/WcJYNdYV1dsW+YH5DtLwrEhJzx1sjo48q1nhQ1qPIXvAvTanP53KN1ommUfjlJD4R2o
	Rszd0sjWFn0j466bbQOKBiuSZ6D+8qIlGhEt/V29qA4fy7BxeGfquQ9lTRkOwQt8VovPdsgCAlo
	9B+0QvJLiKBo6KlfiBB1P6b2+y0FN
X-Received: by 2002:a05:620a:461f:b0:939:124c:b7d1 with SMTP id af79cd13be357-9391393787bmr3624039485a.30.1788274603949;
        Tue, 01 Sep 2026 07:56:43 -0700 (PDT)
X-Received: by 2002:a05:620a:461f:b0:939:124c:b7d1 with SMTP id af79cd13be357-9391393787bmr3624032085a.30.1788274603330;
        Tue, 01 Sep 2026 07:56:43 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm302654475e9.1.2026.09.01.07.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:56:42 -0700 (PDT)
Message-ID: <b7fd71fa-703d-4508-824d-a9816a1e7494@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:56:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
 <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
 <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com>
 <CAC-tS8DcSuhefOMwEzKdcAHrkjh450pG7bFjKkhbdRi0zHgdFQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAC-tS8DcSuhefOMwEzKdcAHrkjh450pG7bFjKkhbdRi0zHgdFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96e7ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=hm1GCXOpcleeJiWVx8IA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMiBTYWx0ZWRfXzzCs3l0dCD6W
 /m0XvAxsU2ikZFlTlgFYQMqERDT8pRVTGWaIEkPn42h3biCL8r2/qM8yxbWE7WGw3ikulf+OLCk
 Q0c9SvzWwqG0YooyNqqdLnNZm70uC3TO3Y3UDVMjQbWZIo0vxfxYgT3d70Sx/FfiV11MOYiaBx4
 5uf8zM+kDV1vajND50vawX4WvV6ZBzfwGpTwmoYfedmYHSxC//3sXFzJnClLzSbvH9oiVFyDsef
 8OM7sWpIz4T+TBDl0xGa9nY9blQUbDCUWuBjNMhee1JvD/R1MhDEcCkRAQXpmVDpZa0NAR+Uz1V
 tfAHH17zKzqwzYVtfrtjkN9byVGbcZaebyNIE2sH6B0nHWWTDQjIxlzvGQEpylU0KYDo2WGj/vH
 tyIRHJllOSQcCC6UX/5GIMzSZxaNsaT2MvpX7FnQIdK7A7O1KSDSK1Pe/KV47zS08vIHd02Mhlv
 M9DGQ/jLdk4w/UglN/Q==
X-Proofpoint-ORIG-GUID: dgC1cJDxaTAq3VLX0WH2n8wlUaOjC_iq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMiBTYWx0ZWRfX4nNRd59o6dj5
 cVCInvqiiHJguDCg8BTktgWkbcPkuIOSlCq42qPLtoELTs/LPNY16vOI++uJzav6MN2T+YlIPDI
 Ow23QdUP969X9mIq5MMDqGGoDMBeNnk=
X-Proofpoint-GUID: dgC1cJDxaTAq3VLX0WH2n8wlUaOjC_iq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010132

On 01/09/2026 16:46, Harendra Gautam wrote:
>>>> The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
>>>> Usually DT binding filenames are aligned with the compatible string for clarity.
>>>> Is there a reason for the naming mismatch?
>>> The filename reflects the controller; the compatible is
>>> variant-specific. This follows the same convention as
>>> qcom,lpass-cpu.yaml.
>>>>
>>
>> There is no compatible for controller and the only top-level compatible
>> listed there is "qcom,shikra-qaif-cpu", so that is your filename.
>>
>> And I already asked about this in v1. Why does this have to be repeated
>> at v3?
> The QAIF hardware IP is the same across platforms, only the board
> integration details differ. The binding is meant to describe the IP
> generically, with board-specific compatibles like qcom,shikra-qaif-cpu

The binding does not describe the IP generically, because bindings are
not generic.

> used to distinguish variants. I had qcom,qaif-cpu as the generic
> compatible in v2 but removed it in v3 as I was not clear about the
> guideline. Could you please suggest the right approach for the
> compatible and filename in this case?

Same comment, literally as v1.

Filename should match compatible, as in this case since it is single
compatible, filename should be equal to the compatible. So first you
determine what is your compatible and then you copy paste that string
into the filename and $id path.

Best regards,
Krzysztof
