Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481996;
	b=sK6qcViRoywyxb4O+YQlNBiP9oEHLtU/mrjN247/GtzspCuB8dl/Am3fASbUqGd1NlG0
	 1udtjJqIOZHQO0LJMygcKwbfiYk8PvaEEYk18qdF/3gKyYr0KCucPKJofJHSs+FJpaMZY
	 u7Wcg/3ggadYJZtk5dqNEFrlpJF6MwLuLKp2AnfiweB4bC0l9ZZn/SCfM6zOTJNwhkq6h
	 QJ1sK+j5mDBgr7qRXklB+lgwwPXxQcjc7RjoLVMCG75IHWoqOsxZ5rI6xYiTsKb2I2kN8
	 Km7cBkmayon2kug5RmvoDDHECJtm0EKfclWwBbb1BdQJ93ypqCiI84poGkl9BRWdEmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481996;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=;
	b=PhjzrmzZXZ9wZcsnouTp5PrbrKU/3yqWxeBXZED3qb8u8DvKKmuaQpHTD3+xi+lurBCC
	 +byh4SuMxfs3/F6H8c4sHLv9m4vIWD6YMuPHl18+R5BvN2y8PrgZhA48ttWkAT7MbL3RU
	 ywJS8Tjb3UXK+0z6vMlIGKxXWtFCxtjFMiSXHImF/aKkxtdWIX4WeH/d5wJWKz+1OU9e3
	 RO/iWIy/g/IM38eETtpB9lgil052dK8iYnsqTSAW2sCzIryWauK/BgsoNfWAHQv8rC6Iv
	 qkXLjoBxUQ7OG+njrgDcqOkrdAT+fMNZEJIxqEnYbAAdpJpD/oJrpg51GEn1vt4sryw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lC0XPaJz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yn5gVibB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70B2606A320
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B70B2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lC0XPaJz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yn5gVibB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tOok4032275
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=; b=lC0XPaJz05GRIrQW
	n1H9FHcfsHzwjpXJJAkuLznQ3BULE/Oxb1MfCFyTfZmlmoLWt8gFqxe/NXJY2Zf5
	j38d8UJqo7WhAax3DnSIv+ltq7sA/D9++ecjqKF4u+ZIxqSOmkwlrq+piF/RfViD
	PTFLxopqD3Pqp+GoZwTJK5SuFwqzNfNhCgBujZxwiqBbHNJ/WGhf+0wX2JMKWcon
	FSsgEm1mYTmw3XcA4pguyo1eWHJlVKhlKdVA1Tv8sebX+dBoDfOoea5u54bYQYJB
	ipeoAagYLEoBsVavwAXGGI5yKpyH4YWyilEtgYvVCdcePYrWsoZ5hvpte0baZHmY
	EXeVkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q9d29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:39:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3960dca5so43290485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 00:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481994; x=1793086794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=;
        b=Yn5gVibBEkzPNoBwL3/U+gk1g2SsoHN3gl5Qb148uJ59U69B5UMsZj05dASOiSoJsY
         E0vJjRWlEeAr+d2mhApY/wiGijsTDhHTc+NV4yGASHfAXtZsNKDYQVMB0efIKEn9GXv8
         p22WZUa7gz0yrD5iCclp03JlAZweY4wlulBTxSYMVYRuLIqIZe9tq/Tj0150OZOGmHJO
         Kygm7iV/r+S4T+GYS1XkUJ6W9XS/wu6n9FuHITwhUoiT0yWALI4A6qhB4p6VjVV6g3kz
         lI19Ib7ZkU9lCgWuliZProu8WpV/OkVscCSWn4m1YnPuzBPrrS/yVahL6ObxCZxgATfg
         05yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481994; x=1793086794;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=;
        b=htppSUkV42c94h+SvbXPZM1+QRhuuIaCxwq7zgL7tqCPzByQ05VTah8MTjnQqca2oS
         LMLcpumKceQis+LaTaL7QtVbbfucwUOwfHS3YLxfcKuc3PQ+gvWXccX7PSwyKHOAYOxh
         6ZLOpKzYsn8wDWA05e5h6niZi7RAwuucYwDKVX2RPX/xQUGAlmIUN1Ygz3Dzv+wd4AfJ
         Md1osO9jICrAqO71EhDYEdrjswzVPNpYcP1pWC0XhX0qoSip0UwLVw5gOu/UfABFCh66
         LdZSFlJsb+JmsIrk/QJYZJX7NaXOR9KOCm72cypHImkSTUBR/xGvSKockuprySdUHDBx
         O3HA==
X-Forwarded-Encrypted: i=1; AKwUvBxZ1vf9Ub6gyU0J5tk+HQE1aJh/ObIZiDCWKfUekBnGNcZnn4ETBuktGQ9jU7469ye3ZoiqlFe4x6CzL0fz@vger.kernel.org
X-Gm-Message-State: AFq9FYK1Gyednr6mYIi1RBiTExyNZjy+9HYBgygbFmmNy2ohyABoJ+wZ
	mSdNrLBDRu0keFHClf9m2k9cYF0rAuHriQPOuE1OpZcyBfgxpUgyhJTPqh8JhCOur/M5W5giG41
	psaA6aw07iQ+At2ADNJpcaY51xVQ07bvnq0zS9rGmsVNTZW2hvKVR7D93nPVmLUVSDlTm
X-Gm-Gg: AYBFou0jHP+GAuW6gNWB3ASZZaYd2+mR2LsRymZpsGdxp5OJyuTTtctkvqh2XubVaxD
	yzHa92IxTtGWsxChWJEGvFcB73pmlEM4J/1PN8TfQxeqcWWBVl8Wv2K0vb9N9Y6AN3V/l43iVjG
	xtKHe+fo5aeo2Cngbxm1zAu4Kg2SaC329Oxac2Tws+Cz5UeGqSvRG3yvlgcDUBA54drBz2lry/e
	KU9RHDmUFtx83XOuTSgzIR6luxdtX7i7A2/GriTfk9k2I7EZEMxPmuBZBynWUkNhwBKNGnEaK2f
	Ofa6rjIh5R2QKoiuchwzckHobl+biVvuF65acRwNpueuTeuVB+PvFsMo+bIFdM6h/96o2mWn5k8
	DxZG+iTAaPILdtSf5GTpbTA==
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1772976485a.6.1792481994001;
        Tue, 20 Oct 2026 00:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1772975485a.6.1792481993572;
        Tue, 20 Oct 2026 00:39:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b0f75sm4978138a12.13.2026.10.20.00.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:39:50 -0700 (PDT)
Message-ID: <491df02f-c122-4349-ad6e-c27987290f73@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:39:48 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C
 controller support
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261012094835.647882-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012094835.647882-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zE0Y736P7PVQ01DzjPPfyWXlkyiiKTSu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXyHHYYZe1edzk
 UFOicr6MqDrWvzuwUFyrzNFvlu50aGR1BWETGreqD8ar2frJlW+QhO85uFFp2FZPsPUxE1utRNj
 ODEoNfn6LOT0Mu/q2m34eNvptDIX5nCehl2AOKDV1icGXGfs2QmNuOBDHBdz+Hvl8NWnOfCC4g7
 Pjc5OU6HdE8YGlY7ZzlZKDByEHUmbX2xSmWBmbxtWLQJR9VLDE7b9IWdJzxbsv1mn7re5bhcsrB
 vW0ISes5p5o8tC8ZA4N7ZE2qeFCog8P109KC+8C2Gh2+GzIaJjKq4zcuqxggkr0y3fNWx5Lf7Rt
 XVXknfGI0/Og0AaFrVV7RIODn62QDUAEXk/HQm67fwlzvA8P6+1abUvpNDr+ZQfIKTJpfrFNv5A
 LmLL8qV3QKQXUvVzDB6BEeoQ3utP2yys0RKqNTA2zPuWtenq5/pAXckx9Gr0I03Ee/i9SoYnDGn
 TJh9HRlCM8+KDGri3kQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX/eKOvIX0aMgx
 2BOThlrCuOMvdrT+RszCMQWxosjBhXccxKX/Bp+xMR17gFCoftPMkxw9BFnXDfXLSIT5EJWJmT7
 ZS9Ksf2vAb/WEO5zbHM4lRo913j5rcU=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad71aca cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0dpjz_nAn25EwL7gGyMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: zE0Y736P7PVQ01DzjPPfyWXlkyiiKTSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200030

On 10/12/26 11:45 AM, Akash Kumar wrote:
> This series adds support for the Cypress cypd6129/cypd6229 dual
> Type-C PD controllers used on the Shikra CQM/CQS/IQS platforms to
> handle usb-role-switch, and wires up the corresponding DT nodes.
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---

[...]

> +&usb_2 {
> +	dr_mode = "otg";
> +
> +	port {
> +		usb_2_dwc3_hs: endpoint {
> +			remote-endpoint = <&ucsi_ccg_port>;
> +		};
> +	};
> +};

Do not redefine existing nodes. Do:

&usb_2_dwc3_hs {
	remote-endpoint = ..
};

instead.

Konrad
