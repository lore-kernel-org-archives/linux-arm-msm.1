Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577505;
	b=BlRcxQMxGJUQtMkuGreYBnAijqfX0f8qlRynDPmBqgzhmstLYU4Ihfy+5AOfTVfLgoiM
	 XcRBn59a8HNlw1ih3MRn12fa7+/XsDBuzz7XAui2YiPhkVvDlgFjLx2On4T56x0JOjkPJ
	 BZSO9d4iqU7N6nG926xvI5osmo/HhPFigtv5TF1JJ+bgclSqSNRpo3dkrKCvF82Fx/n4H
	 dvUgXSQSaC07h0Siqk7wMU8phHzxp9BrXuU57iU8ZVFLiFKNI+89fOX0wC98C8xje8DcT
	 YCq9Fg5wtAPiuT/YriuhdM4BV4BkjIde68MR/8zSOPyj7BG9FqqyCBO+Fp/3ntm7ZCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577505;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7RA/TbCtoW0RTFGn5BbfFu3qtFsWLgOrhKfuYxlR+MA=;
	b=hsTmePPgCE7oId94C0zyLAs8/GB7OgZ94aTWTcW7Jn+okvlKVFUuB2jPq9L6bbEjZAf2
	 q2o9RAfLhzHXCbwtUHmCWGnW9/84FKPZNMi414LvDTfqXo9iTbTTN+A2ltPlI744U21yy
	 xaPAYuvViwARMmhwY39wIgs4AUzztJ0uAHwYxGSyPdRa0fvp8uJFeB1ZwmXsOndayuHR0
	 NVbRXMG8NN7fsmfA9/dPTx4eKhKhKrtXdOBZeHzYuxPORQzpx83lMQjrYGZPoAaP2kMBT
	 2rwmK4zo1JRk/WAAS9ANjRzwg+QLwoA6t1cfBgduquiZbyYNHQ0nch/uMXrQj525mXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JU0UXLZg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EoOR4KpI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA60606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA60606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JU0UXLZg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EoOR4KpI
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA65e0768752
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7RA/TbCtoW0RTFGn5BbfFu3qtFsWLgOrhKfuYxlR+MA=; b=JU0UXLZgv/aesNL9
	DkhERiOeUdF/cM0awIlxTk0TQAcwRoizT4N457qvyLadUnIP1/z/UbdVjWlWO1KO
	oZduGNiUvcWIyhWd0SEXR/+kW8PDUc4gCmMeTGp1gNYu2A6VfbXx5+K3haslaoOX
	MYZb5Dcpx6LL9y2FL7+Du2E4WK+hrggO1Ll2XXAxGLSHtIeb4IvfHf253rO0BKYT
	MhJ2XDgKYiY0CZ9JvQuLITqLxtjnyoiRq25gCIubxUACcUq2jArwL5IRe1+7RbbV
	a8IepJPaBhxZESgQlRNUSLzebni4H7erhfughpxxGTSr7I3kanPhRBZi5lnWSbzd
	U6lNSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02muc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:11:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so10628885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577502; x=1793182302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RA/TbCtoW0RTFGn5BbfFu3qtFsWLgOrhKfuYxlR+MA=;
        b=EoOR4KpIG5n/glao4kPsYKR60VJw3V+U8H5SnXFz6UUngX3xXHBMbprzxRq0JkgHMY
         N5MQCOywZ0GF2ytgG2xFe8eqoAEjRjtacSyvOKeLXPEtu1pmE28fikYN/fkvWja/GYgR
         yupNIvC8m4LtZxrWc64LI5fjjk+1mSnKWOnvBA5p/93dtHFAUsOq3dxN/Y6TkPOrVUUJ
         SbXU/CpFqMvB/MJRb1yc/WQ8zVJln/uabwKUOcWsnPSD4Yrj3SjnLZTESCAPgN0ASKd+
         hNjwNNyFwtwSddBkwUmzJj9zmCtLmRToEG968MPEhOVIxL/UR1mqA5b68F0rvozvz4KZ
         f3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577502; x=1793182302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RA/TbCtoW0RTFGn5BbfFu3qtFsWLgOrhKfuYxlR+MA=;
        b=IgQRriCOVp8SN2szkszzL1it/kjALhD2U0lPt9DNwqD0ReIJeHhXM0zExfacW4YchN
         L42ePMbs5t8YjcTrH2+1GaV5bdaiEOkt4s4JF5WlfIugvPdEyVVG2qse5NbIVpZ6V/VI
         dUEY1G9mxVT+wOX58TU+hdQtsJZjllJ9+E18fTjv0oa24aFldZAhFt4VKcCzqLN63t6M
         xt5f7K5nT9dfBm4IJlGjejuRKSm/FLdIaTksPRqWYf5TkLIqrCEbbmXG62hpr/6JNZCp
         GG8Ns5z7Z2mstAwvDCtrBenth9r87zy2im07m0XW5XZlzVc8Jgv+qhzyD/lgvv+brRyh
         8QLQ==
X-Gm-Message-State: AFq9FYK9I99lZALGu2aOJ/lFWUU1l6IFhonEP5cL5PXyhPQb1d0efD9H
	Z7AJxpm5ubBG8DAkm7qw0ECo/5uH0PNvlRaPfAi+F4hdHJCEP1spIOfcC5BDCBF19wIDKo1bzvG
	ebtixKQZuJu09qljU23st2T1PICZ54FtHO0QMa4bkXstbK4GZibLevwVO+9rNGzRS5w0B
X-Gm-Gg: AYBFou1Xd/67GuG9EnZF4JVzJwKi7LVGboUXx0aZyLBJP/2DzICrXDy+SouShRdi3lT
	j52m4hP3BaDR7t7yPs9gIZsZ8pjoda6dYY7tUZB//0ggalZJYA+qNzhgZAoLmq6Nc/OsUJEWPLt
	/s0ZGXHmQzglQhwfmxcLWDnrftzJcGZa+nEbCfDENcDaGq7C3Bq7cgJxxut7NBRddwW0CkQihPR
	UdVenpUFQ3jDpG1gAwNii83ADQSh5Y5RGgwTk7NzupQzrUozYxtkZgQk7UeMWiYrjli/+WxvbWA
	13AFf0sVSyNLHsL+mLGq+BrvuP4/nswDTBfFy1lgUSr4V40F2xtDcrrMUwxvWE2owPvoyaRNv3T
	MsiTvDWCLYjwQUgBsFeksjg==
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr371155485a.2.1792577501932;
        Wed, 21 Oct 2026 03:11:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr371152785a.2.1792577501520;
        Wed, 21 Oct 2026 03:11:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678faa02dsm61960466b.40.2026.10.21.03.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:11:40 -0700 (PDT)
Message-ID: <c4f82514-14d6-4516-bc09-c735f35978f5@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:11:38 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_adsp: Fix 64-bit address
 truncation in translation
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
 <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad88fde cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1FkldgVRT0rVbtvJ3NUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX7gA7yVV/8uYt
 gvH4debcE8LmHiDss69/UKIq+hF8U7kWNmOfya0Q0fB7OyKeDfwzmrC9kdqzUqD+uFmnR7awN4i
 uOvASwUlIAIhqvVcPoKUTN2rS1jw3X1av4Ynb9/zy/V90icyG9gKczuNhmz26ySaqWz7/F/LrvB
 Qt3cIhoXI8qiYH5g2FJ5pUVJj+2bDZik+erS2UpVSeB6lavBxmWcwseIQsPEIrvD2JqsaWWPFEE
 OTBeleMhW+t1ZDvhgO7BDbLrr2yNzMTFzQg+FhIkJ2K6xMk9RvZqFORqh8CY4umTaTlfZXT5olg
 CYnOI/n2ZT3+KFqJ2ID2s5ShnU1LOuDSFF1o845YG83FGS12QzNkqotA+otAIkm0jBmj5GOt/Fa
 6/IYuFBVYzyQSqU56fYa2k6QvTsX1ZQ+IJde7ja+4YN2cbc2oB+YVBd6Wbug6ScQPfb9AeEqt//
 7qpyGpd3F67ccS9vamg==
X-Proofpoint-ORIG-GUID: HTvQ--4SyfWw0Vi5yOayoNuuSVrw-sKt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX1qpfu5MriAtW
 c85cp897JNqWO1jDYFO81ygx95wP73uJvza5QHq/uSp/00BTR/kLze0IKrZScTYyZk4ocY2yInB
 TFHenPBekD6jSvTo1Yg+m0IJnsWxCZ0=
X-Proofpoint-GUID: HTvQ--4SyfWw0Vi5yOayoNuuSVrw-sKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 9/21/26 6:36 PM, Anup Vishwakarma wrote:
> In adsp_da_to_va(), the offset calculation results are stored in a
> signed 32-bit integer (offset). On 64-bit architectures, this can
> truncate the 64-bit address arithmetic result if the subtraction exceeds
> 2GB, causing erroneous bounds check failures or invalid pointer
> translations.
> 
> Fix this by using an unsigned size_t offset and explicit comparison-based
> bounds checking. Check that the address is above the base before
> subtracting, and use the form (len > mem_size - offset) instead of
> (offset + len > mem_size) to avoid unsigned overflow.
> 
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")

Konrad
