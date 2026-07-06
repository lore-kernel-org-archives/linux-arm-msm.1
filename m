Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9726E41A768
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348202; cv=none; b=HOHUhdBA25rGpSJ6dxsKvKdkFPuMkDIDjanbgBFkYyenaUn9PiiglgUJ4RMLWSIABWLfbBfsoHsApTKgHnPC6k2E1Sd5a0qEsonIYSIIfhV2jpdEkNomB7cHWcjWcz+ZxDq/AlzDVfYBq5ocMlC1oDsqE+ad7cw1PJeTMb5ObR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348202; c=relaxed/simple;
	bh=enUDLqyCCOk7xRn9AsA76+zJeWqf+KEM2d72NcgrCCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTfi4aJ0dtjSm50lvoAs4/kE9oHcfY9eYBiBJb2qiXTXGPpcczScDrWGMQsVcUV5mrLB6SrPovns60yNzDP1yemwieLpgFkb723zuZU8tUeiqQ0waXup2Tbyt88Ge08cyZkvH5b94PyHB1ObMuUUMivZ2k17QNbcCsGEbDSRYos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSVsYW8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cIpQlrjI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSVsYW8t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cIpQlrjI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE4f4837559
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xat9AHdfa9iwq7frDekPYVbN
	vuDCv01nEgSbUXVqbpk=; b=WSVsYW8t03yHr87bYqyeSbY+5W5R7kK7sWvOSW1N
	Gbbw1YIbomEecJp79Tv5Tqu26xbwlXwJhRe9dlaf8tvunByf6krmQFIHhKWC1wDY
	55jsYmEdIYi71vmiok8a88NxUEKp6TCB7HV24MiQ2gADMZ1bipM8mRDVXP4ofvp0
	0o2eG4INM5vS+OxrLnEzYO+OAsZHAKaRWQFzjulTvNk9rNz49Ru6LgFu5TPAdWGG
	Hj/d0ksA9YL7NL95LBhZ5aVvWvaElKD6BCVxyHqH67vMQH1lhxUwUAek4kVwFr4q
	MzzyoW0kn9/6DvssXoKxx8nwUTdAewgngc/XwHvQeNgSEQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qph8ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:29:59 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bd954154b1so1067417e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783348199; x=1783952999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xat9AHdfa9iwq7frDekPYVbNvuDCv01nEgSbUXVqbpk=;
        b=cIpQlrjIVcUsJ7m03ZmB3/eqEaU9P93iBbcpckeMbnBNn9jXqYK8pR41UO9Nf6xo6H
         wgHNlUoE5WgbLDjBIBzQMLcxaW8/d2xzoMr1qiSHBTolbJOWxfrSSqRSUIssr5xIXos0
         jtt7qaPW9WjNEIsadNYVBXYGHmDGTa/PS1noo8MySyOi709ePn/xbS48zV38TkcJKRJO
         ACwinCU50FkEyn3DAf3kBXveqU+nmGiyx1tMcnB9n4feUXOj26eODJnmULmA+EuN3rb3
         cAnob0LNIX+O27QwZDsvFYg6UpTV3dxwQ/nec3+o4oqg0MzrNyT4AU7JlxzP7K5bQLYf
         SoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348199; x=1783952999;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xat9AHdfa9iwq7frDekPYVbNvuDCv01nEgSbUXVqbpk=;
        b=CTFu7Wj08232wyT/IneAGTfOCW8jR5zgBGaFVu7EEmuRVtAq0laEYuz3ZEtxhC1jge
         9/DrlIbwOzcy4DW47Whh33UHAm5c3abyTgsaz+i2LdBxIM08l8M0jfnmHjHM8PYfYe2f
         cPxrmYa0jfrrWfEskIYDs5bU2xvKiAyaGU9myUCVe3cXiUAZYoyNcU/v16ZiwwmicSb3
         wKwMqzTeyCGYbEeKEx0JlRW4GHZ7d6b7RUbhutZcomXqfrLJs5JjVgAvMK1oqucuqYH3
         +wcLOXDDUptbYNjDbbjZrT0rLG+wYxoMgPXKks6Gu/oAdiy+ftC5JK+orKqCmpvzJMX7
         yXlw==
X-Forwarded-Encrypted: i=1; AHgh+RpmqAGGwnCNPTiCeqgGYwjdIYmzN8PiDu/iZE2ZL3DTRP1M1dXMAAI4R0jIlzX2I0dxkCTBgHLuzYSOkIST@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5LFH5vOnV+v+VQhNUM1bkqxkYDcaqGKfnZl/0H8JbVBg1abk
	Zg9W6QBw3DEUqbk4dTpFBdQRm+QJuKphtE60xdRVrdZABJcvuqcNJgdoBLjrTcIGuFgtCtpy3zx
	c+0P5HbbMb+8q6edUL0CuKlV3y7tANx1AeJBXIGHX9wutpwVoekHekXmG7XIYDgZwfGR/
X-Gm-Gg: AfdE7ckAaHmEg51X6ErlWUS+8fnM7OgwlctYHRcxVJsT7gT9DDkVx+ulzk2nnEP7Biw
	aERj79AD1Didc2TaiZ+ROKRmHGeOeePRJx7YL9JSgRggfJVneDstL+sh7oJqoOgdKmgA0D0/BWk
	bopRA4qyqDq6j4U7iBVO1YwLqe+ki33JBP4l7PMVb4bst/Ih7pqNmcbbUY0iwAoL2uwVACO64AP
	JnQG5T4iYdsjH0dCJzxGo9h0kNxtPUkDLik1PAjYJCmCi6U3lJkPZbyBg+TpU2hMzt+w8SBFwOL
	tUVXUrSjhuPydGCzKhsQD/8IRjpoW0OU346T1LufMbeeXfwv63SAMV5ovttZ8QQQWKY0jAgprhG
	qNM3t/Gpsf+p92ce8SRjjByVAGvr2KydzsMbRQhW89C1iUJMsEwg+icLOPmoRbK8FlgRRXa7sKd
	pY8GF8RCYwkhwlMt6DriHWDGCV
X-Received: by 2002:a05:6122:6609:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5be9085dc3amr472095e0c.11.1783348198892;
        Mon, 06 Jul 2026 07:29:58 -0700 (PDT)
X-Received: by 2002:a05:6122:6609:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5be9085dc3amr472059e0c.11.1783348198306;
        Mon, 06 Jul 2026 07:29:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377024sm2923549e87.26.2026.07.06.07.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:29:57 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:29:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/4] regulator: qcom_usb_vbus: add register
 abstraction and PM8150B support
Message-ID: <tejtshxer6zb7vmtuuucpizbuxwomx377f2e2zfhsxgm73qpug@vzp2v67ifsi7>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <20260706-add_pm4125-vbus-reg-v3-2-999d78a87b81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-2-999d78a87b81@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bbbe7 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=mSBXN4lFcZzbJCLm208A:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 7hVWj0DI4qpQSotNOdG2aB4yCjd9Bnri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NyBTYWx0ZWRfXzPOIGyC5V3gW
 mH2d/2GUBwF8UbkToCbTX6THbMufZif4g73HSsTDlqTiJjGEQ/QsV07JtaF7unRAh9KrDiKgd/g
 PTQcFcvVJrdHSbriZ6h+ITvPn/UVE6ltgxQedSkUxFxOSXaRi/XSmBhMbrApIVbQN8x7K2aeItZ
 /CZ0wT+uKhA5Pv6lfmrNBtptzy9woL6aw5wWuJArV6Ftvs/7iLHG0hnY1NtOvVFk2L8OGBTjEtT
 LmOudkU2htLItX1atotpJgrQG6SO+WoGIL5Q6ZwI1orOEUYAE0XsU8yFabTHSOj4IF05D9e9AI5
 gws4KCP21ekNytSZxEUTNLvFqjF4LAILyTIEmjGqgEplX8wqIgLIt4yZUMX/bWoks1v8lJROEd0
 DVjQMdirkbS/Zd1BTrTzZp9by14l+1d1OvJlTUMXAg9LNoRWiI9ot7evfgMPPkZS5wjb8/9j+Ru
 Zn7cCcmEWfIREEjAqoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NyBTYWx0ZWRfXxLVDljNhd8VG
 jG0XRY1MY1wTxSqwg1lK3iZEKqFKWyBltffQVvDXvz+qUxdf68a4Pvn1K2AuD+2G6EuZRKGmYk9
 10phG4n5rm57f1K0t/jM0DxHiXnxGhc=
X-Proofpoint-GUID: 7hVWj0DI4qpQSotNOdG2aB4yCjd9Bnri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060147

On Mon, Jul 06, 2026 at 06:01:06PM +0530, Rakesh Kota wrote:
> Introduce per-compatible regulator descriptor data via struct
> qcom_usb_vbus_reg_data to abstract register layout differences between
> PMICs. This allows the probe function to dynamically populate the
> regulator_desc fields rather than relying on compile-time constants.
> 
> Refactor the existing PM8150B support to use this abstraction, wiring in
> its CMD_OTG, OTG_CFG, and current-limit registers through pm8150b_data.
> No functional change is intended for PM8150B.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom_usb_vbus-regulator.c | 71 +++++++++++++++++++++++------
>  1 file changed, 57 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
