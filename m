Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116534;
	b=FpeRkCdNP7+8GX3D6dxCgmmcdjcPYRA6F/ncRSO34c1GEvL4pBB2NbZzGOmbYDFYbfgW
	 gJOn261L8rQAcMwodyHODPpFZrPqAm77WaPR+XvU5ZxDt/80XHh1B1J1ctqOCOmQQ3C4A
	 OErxolgX4V7yU+jmIjhP9ZBABQ2oKDGHw0cyvV5psTQZT+mwrfI7TSmQE43QdCU4mD/HY
	 LE8Wpe54BwKuviIdzou5wtKL4AEU9NLPAxg+aG9mXDtgQ8ueaX/kGfHboLQcaMlVnn58E
	 C8DVxWK/Hu6PidGyrYXF9Zp9b4b/uPkSUX/ZCqqbYWjZjAM4YVzSbKobGEmGywC1J8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LgOLWT1VDun054y1i10LpGN3J/+lPVBwMJuc5wTwrNI=;
	b=zaYnyj6rKL4+c0Ul2Zge2oQEXSd3gQVE/wQAXooBSUvqeXFIXqw0Q//GxgyHbssN/7tU
	 eTuLP2R79Iueq0RKiJLsHpaBAV0X/n0D8/1ay2Y37JGsvINU0Vta38WffUGJwkoe92pZy
	 5vxib5OKfMJXZSl9jy6nSWDBVFfvP4jhMvD3fVvGp3XU99Xgf6/zpAcu8wnEi+ZLFYhPU
	 897tGT3K4Jf+wNE1eGd5YpqG2fowhcuebywq/MAP44GENQktFOPLXokz5VvaMRjU41lUd
	 OSgcbrV2jTerpwHg68ui2iMFXsA2w/Fel94aUr0XRqpp9naE1VeN3zdTeHmD81x0XDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=huwPXjlq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYuRibqL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29396606A324
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29396606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=huwPXjlq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYuRibqL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL8hr2242307
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LgOLWT1VDun054y1i10LpGN3J/+lPVBwMJuc5wTwrNI=; b=huwPXjlqeu5xpVR3
	5jJsipH1meaqhS+82jJf0aSRmbG277MFBcREcFHooXLPyF1E2bED++lTwRxb9K35
	ehuR+r0ex3ySOknZ+BvefsS4pPFweTklJ+adJm3KHDIi7rxd+ozHvYJMwqy4nGHE
	be7ZuaBGJvBhzcLtgSohSNVpYehUhviqrEUfClWeWrAI1bOK4vZWZ+zGsR6t62GC
	CCh2OFa3aX/AxUofGx1RKrkLUWgpeanzLQJARbzpiHVUqNAUgb/gvVEGghNR9M8V
	qIuyI/EUveJG+drzBUigs1KA904Ikr92Ml1yv3qqqVyqLULnPKu747AsjfumgB04
	shPKAA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5t3ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:55:33 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc2c798d76so95385137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116532; x=1793721332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LgOLWT1VDun054y1i10LpGN3J/+lPVBwMJuc5wTwrNI=;
        b=dYuRibqLZ8VLQ8X1ZK180f6LrvJnwkb4QjSS1j/mJIAwmzOKrYMpO2tHzIVMDcTw5n
         LmROeCMlBXUxE5ugYD+8dRXDp/EGMLSRy3yia9F/aLBPb6D2biVmVm8LAXhJSBYI0K1r
         0nYDBkXHKyU9URFG20mrlN9j+6gD4Bq3az87CPPv6eZefFUg6oOa+NGOROsnZ+Us5Z95
         X6/BoplVE4x1qf+BaJB9vGDgPRyVgYp7jLAvrqbRfat58cb0dS5RDgtEB7F1vZoaFeEm
         oUcqpt2r9xYybahxDXMqDDWo2ZcGubC5WX4HbEMjOApDsrxh8AnnQssXM8Grog9U3JKq
         QmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116532; x=1793721332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgOLWT1VDun054y1i10LpGN3J/+lPVBwMJuc5wTwrNI=;
        b=XfDciLKNcXxo05w3DV2QR2QYmeKrNywmR8Ivn/Rk4SvVGLyCD70eBwc7NQUE9VlEHc
         +TYyFRubUbbIeEJgc2wpf1Dr66CuJxzMYLgdfDTZ6WfBqKnNeUh95WWpDTlzyDp7UrEK
         1Zw5Ez9zYABCW6x3uDBqUALhgZ7QHj6BtOhMhyiRgFABf7MB1URTj4th5O/Bbwq65VxR
         SDsWy7V6nIfWRpQEuS/j2RrLd3Db1NNEQnaNdoJyh3yiXUM87s7cXNp859kP6ycpiEUs
         Q4BnoPi45Um0eIGIoMbG6MDQHMxWwTMiFkv8kBMYvnyN9lkRihVmQOAyEXwQ3HtrcIeN
         zMqg==
X-Forwarded-Encrypted: i=1; AKwUvBxKweFji2GDpqLqYSIOmNfqk1TQkjIcuW78KQatc8K0ekSlYtkm1mUJ848YvGK1y7KG0AqAbdb/Y8AclI4F@vger.kernel.org
X-Gm-Message-State: AFq9FYJoknE74XbOclOoaqgO4HWbIZJzfaNmmYNRYLrTiUIlXuWXXkVW
	Mb5HEQMmGOtlaCjdBc0OAw9uWTLwaVoHfJBdeq1buxzSbnuXXB9DKNlBQ7y69ULr6d24/LjcKip
	1Qkmz10eMCKh7UI3DD8afKmVrU8oeOy4FL4bmY/+0JtyUokyNYlg312I39MTJXniSDuO+
X-Gm-Gg: AYBFou244KnlIosLirhA6woXmyeOxDs7zlw8YQtUKioe7n4gtQ1Z+aHcgu4ZCVqj5rZ
	lGXVbr4tCMDFgVUup/VAaElF5b6CLs7yWGIGv54Zh6ZWcz4Fs98ZxOSOOBpjbwn60ph7gRBpqiP
	9KSyA0azr4KYLuB/SanmsQ2WWP/IEQZEH9FsWaUm35WKoCkRzVwY1ucSVAuJ9P9X6rNoco7oGBJ
	6GsCWcwFXd+Xg153geWmpcTNsWaN+vEFgyS5/hs/ZMzs04fmyh1oc3fCEQnRkhZQgm9jNATDJ43
	LiC/HOHzTYGL0+r/7fmW0f2vffOdPJ9EFONhhRUMxLaTXXQuq8mjGMPJTTr3x+WTbnwNsin7fhw
	9BG21cqrykJxkJJHRgwqDyw==
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr4330075e0c.5.1793116532612;
        Tue, 27 Oct 2026 08:55:32 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr4330022e0c.5.1793116532143;
        Tue, 27 Oct 2026 08:55:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66ca8asm483938666b.57.2026.10.27.08.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:55:31 -0700 (PDT)
Message-ID: <06818727-9a6b-4618-893e-5c1a78e00817@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:55:27 +0100
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
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize glymur-qcb.dts to
 glymur-qcb.dtsi
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX81IzadpShA30
 UZPpc+pfwfXwwaiO4gYFt16hQ7LRpiKwRXt68w+S0PT15kfj0ldplcDYhd1FUnsey+e1pUV9X7B
 eQI726blcq8DpoK3kW0tE/4ZM0uTAOE=
X-Proofpoint-ORIG-GUID: v-pjO3skI86vHPSfNRHb3wenVPNTh4oL
X-Proofpoint-GUID: v-pjO3skI86vHPSfNRHb3wenVPNTh4oL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX9/7xGeDuQ6+S
 zGtcjGl2IXE9xhnBOsfV89jwzS5Sh3ocANc3TtxvDbBIEZlMTjf0LEqfFCGpHkCGiY2rIsQF7TZ
 dWUASPLm+rwv2meFzVwBHnImSuJVvEkM3iKPhlWmcBMSK0dWq3OLT+NSRDzZjkZq98sYCd1Msiy
 ZZiSAUtPPRuAzx+9YpT8h6PV1IKUQtElTZ7YpDETOHdWx5IaGBJuC+va0A/8W+2EtJg8CMDqA1P
 +C6qktH36KfpFi8u9tIf+QekVrFfQDP1VW3zVs3uMDaiPRR6Rv/zlSJPkbFV5xIVxPlwjC1jiSg
 tz8v23Zfp0u132DjXvh2tisGZ8Is7uzGZavZXZExaOEW5reN9dWP+nWD69Fd5ZcuxMc8ek5nBLa
 lC/u6TZinnCyX3U7hRCFKXy1/n5ZMCRsxD4WDRLX3gU82TnsHCLhbdiPCz/QhxETRusM83dUVwd
 drMa4dODYfSdCcyUrMw==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0c975 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Ih_i2Spn5ghOVsltRIYA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270063

On 10/27/26 12:49 PM, Sivansh Gupta wrote:
> Glymur QCB and Mahua QCB both share common nodes as they use the same
> underlying board.
> Move all common nodes to glymur-qcb.dtsi file to allow for reuse.
> 
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
