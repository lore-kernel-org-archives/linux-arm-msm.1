Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E786138AC92
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 08:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425405; cv=none; b=KYdRSE8oZb9RZJ1MPZ1Ryv9NvBT1jaZ3JDna961fkOIjn5LC9akO/VGyCz1Cr8bp0cLumh+HdFh5ZUNJpttogr5Fapz/+ZnffVphgn73+u85wv2T3k32Mq63f0nfHGA32JpJ0Ss2mMCj8HHTexUHaXfRo/og7uc3QRJj1a3/2n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425405; c=relaxed/simple;
	bh=w8bpwp5JplGsPMmyl3ZfVaSO5T+S+y2Xy8qZEQhm5mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShE519bFmGgfvsAIZ2tfiHqLz1wbqrKEnzLK1xX8jh6tuldmWrvHFMt1beshKMRW7xFpMnBUTFfh6dLDlzDKFSsohDSZxPBirHYNzCkOAFUMsxnVAY0g+XvOLBVQuqoYw5qfl0Y/YwE0EVp2YC+xTkTabspa3E6lw5fMZCfo1Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0cv/3X0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bRexBtbX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0cv/3X0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bRexBtbX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6838QlKh2954611
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 08:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ai92hBBfiGHl+Ml8jGc+xQY8x9IldMLSuh3vIkXnwmo=; b=U0cv/3X0wX4hnYLL
	YkCNlFieViraQLMAJdbfTInhP5YCVRC21a/xQeEy9BkNu8F4vTXHb2tU4iVESRta
	r46lm4MhCzcuB4WdH17gTsXdvyYQqz40Wz5SrpVN2U+aLKqgJdVBA99UqpSsN9ke
	WcbVrFymtA9mIXAx/YXbFeccTaMzhUGHexuTxoNq86k2Z5zTCqEvyv6X4Pud29sf
	DGV/0hhIW297uJU46kg7aUuG2xqf+fMCvVqAQxcGrmt4PR/OkLNWZrOSyDCHZT6V
	q/1ry+ZlJU2fWmsEnCoPCpe//mpJ8sXrpkZooYxAPkLcDuqw20K83/rGL88rMRyB
	UuwgRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d10338-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:50:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93821883e26so54285385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 01:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788425402; x=1789030202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ai92hBBfiGHl+Ml8jGc+xQY8x9IldMLSuh3vIkXnwmo=;
        b=bRexBtbXsHr4Esb9kKsyhaxYCGPCp0AaIPOU97B3MxTwUSMoKWihWYrfTSYjpZgrG+
         kqaJRP6vbuwmGchBG+SWZfNQOM4yAXGc7HkCOgpe/qMyM8TBrLa5M7/fzgCKgI86rjVK
         4p0THVk2Pz5RBJHh2uJrpwS5X4/ILa5X9zWT67s8mGTYG74vFh/iQ00s7F3pfV2vufwa
         wTpFgFr12+4xEaOwU/oQ3K6DIU9TN3/l4gL+nEge9x8Vv0DDvzAtHzEMOU4T9fEWV8ox
         vAjN9j8r8ptNc8IuO85JoMsRnrIYmHwqnC7jF8OlJurs4G4G+SJFNZMVhDDaZXXAdga9
         Tsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425402; x=1789030202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ai92hBBfiGHl+Ml8jGc+xQY8x9IldMLSuh3vIkXnwmo=;
        b=ir2ux8eLqd4eoEfsuL8f8YrjvY/rg8IA9jcRZ1FHfCBpFJBuw0d9QxA2pOhn+w6SoM
         GEB9TxOTLSkxT/vHm3Pk1KxOGYQ/65fqS/To2XiwlQ8edQXgMc9CaCkK1ZEBdK7F6XiV
         5/4Yt/aGXaxLMl92LpGrEKM4fUBiqxF34mMmqB/OqKtEvjD9rFk7FnVeNKfPIeENcFPk
         9euM7CftCgEhZt0eGWBJH7EEJ340bcCcduw5BlOia3xgI4T3I7LDlpbwg6UGsOCoKlh0
         dsyhtLwJgVmQ5w1P29i+Q/SNOcUFURuO4P2qz/nwdKQBFP/PhVPnUCNuH0Ziq9u4VpC3
         B5Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzbVIBXtATDXo6va/IXagVUVrKUmA2o97zxDPL1IFMVlds1g4/ektYawbd18XRmOzwFR7Ujid7wmaipan+s@vger.kernel.org
X-Gm-Message-State: AFuF++mHamI4PVrICwaQzEcZnflm8pgypk5YDodiBW+RDBCPddHcwIER
	1SeZDCaoFAC3WbXL9LLojIRWhhHKH5M8cS0hGiiljNw6HIsRYmBSFGgVKL1BIEgBbTGBfENG35T
	J9b5al0cyuT8Ot0A86A+E6itMS7QcbQIURrfdVPx8X82xbsj3TsH6tYX2N94Bcsi0eNDt
X-Gm-Gg: AYBFou06H6pZIbbIDRc6MuVcfNMg+oQt21GEjS3TnfvxZ1kpPVNhGD33TIlVQWILooU
	sUwEvtyAqmh1CkeiBBq8VEPobbGe+VkvTI3hqmi+by5xNhIAe8CbH7MRIe1Ry+jT+HBhbToSv5T
	8Mrt34O9IV6otHem4aZXHsDGt4SJ75NBH+Nn8RxT+D2TjLtVDX0vN4jNMkwtWxtxKINiTBUJJaR
	BxHWslBfNQL230cPKdypi7sw40ITpWcsVJkBpK0k6BKPYcxE/8Y358XX12pM9aUh6NcbdvQJ/o4
	DcyxpEtphKjfM+IIZ4ywr+mlIRMnqmoxuDwPNXE7s39uon7H+XA7kFCmkGfM5653a6Tz6t6ebRv
	uaizbrpOLNZPB/fW4v0Pt4Q==
X-Received: by 2002:a05:620a:2b46:b0:939:288a:8a30 with SMTP id af79cd13be357-939610cf0bcmr834693185a.6.1788425401731;
        Thu, 03 Sep 2026 01:50:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2b46:b0:939:288a:8a30 with SMTP id af79cd13be357-939610cf0bcmr834689685a.6.1788425401360;
        Thu, 03 Sep 2026 01:50:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9565bfsm2029048a12.30.2026.09.03.01.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:50:00 -0700 (PDT)
Message-ID: <52c023c0-a61f-4116-851f-ed19de4d23f2@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:49:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: glymur: Add ADC support for Glymur
 CRD
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-6-9c49b2eea6f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-pmic5_gen4_adc-v1-6-9c49b2eea6f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NSBTYWx0ZWRfX0TVakS7nl90w
 XChmWwU4xUWT2JjKkmw3Anf4fG2t2wY3UVIGbq78ySUAEg4odafMJ9ym/erV8gK9Lvbu7pEUAEw
 Onpi690RwnToKpZ+YDxaB9tYTz4Yg2g7pqaJ9fNziR7YWYSJtCKH5nIDQSu/j0IJtXKPNRBRMPp
 srBcijwwsSFkrtz0kveqITCgsLK1W0rZMxl8HwVFMuWg1Hw2F+7zM6ZZwOgg2dyMB6JislK9wEh
 HlnGIa892V5QkAK/RPM4l0zAk5oaImDep/x03JXpNmlNkklTbTrKR/Hmuui4ZAy/7CuwvScf/va
 7LZ1tr6rrqe1up7o1CKeYnYLeL81xSqyfM15PUlKXHQ1E4yIC4b+AjY4B6ojdAFZLRooEHopSv5
 1Lwc8m5BWG0n5yImWmLpUFaDO+T4ML5JKlFyuUwsN4SojvvngOBZi0IkdH8sxjSvnFR2JqE/y0W
 dE6sF5ESckVMrBiWGxQ==
X-Proofpoint-ORIG-GUID: tDp5OXPHYhlC-K7qgqeujfUBuGOh9VZO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NSBTYWx0ZWRfX3h+x42LTULZy
 I+HwF+ZSqvUD3ntpS9MEf5e1giU7Yx31j3d/9C+/IK8fcoXr/Rd0abuv0MPnPEe2MPKA2aBquYJ
 h93+OVVcO6cLroye0LFRn/vJdOvzsWQ=
X-Proofpoint-GUID: tDp5OXPHYhlC-K7qgqeujfUBuGOh9VZO
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a9934bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=R0Ww1y4TKyaFJa1J-xIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030075

On 7/31/26 8:06 PM, Jishnu Prakash wrote:
> Add the ADC channels under the PMK8850 ADC node for the
> other PMICS on the board with ADC peripherals. This includes
> die temperature and VPH power channels per PMIC.

[...]

> +	thermal-zones {
> +		sys-0-thermal {

Please name it xo-therm or something similar to make the connection
more obvious

[...]

> +&pmcx0102_c_e0_temp_alarm {
> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(0, 2)>;
> +	io-channel-names = "thermal";
> +};
> +
> +&pmcx0102_c_e1_temp_alarm {
> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(1, 2)>;
> +	io-channel-names = "thermal";
> +};
> +
> +&pmcx0102_d_e0_temp_alarm {
> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(0, 3)>;
> +	io-channel-names = "thermal";
> +};
> +
> +&pmcx0102_d_e1_temp_alarm {
> +	io-channels = <&pmk8850_vadc ADC5_GEN4_DIE_TEMP(1, 3)>;
> +	io-channel-names = "thermal";
> +};

Are these going to be always wired up this way on all Glymur boards?

Konrad
