Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577432;
	b=h/h6K2HHDQlS/N+jlFXxcHXWUmffnVIu5XwC5Sr6s36geFvzr3hLT8g2g1PDcQARiPR5
	 +lsqatNXV6TqgUvMHlmieXSFrTj5XzJb+Mw6msgimFaaYyZ5/pGYzeOEf/zyx45DG9wuw
	 t9sGENwIu788uMVlgHVdKQR65Ymvul6c9HP4k6s4rtHoiIsXU5FWpq6CjovwqHcPtv3uJ
	 E7XgHUuspSYMiw01YoY3pDZiEghBPc4bm6tdbsCDCSG4P3kRnXKv0YAuTADQIua34quj1
	 Gz4lC2Lw36wDbqsuNo5HIIofpT3hXOZnItptyX5jfdnwQ1kel4cK9JSg8avckA70hkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577432;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ScjAysI8DSUS+F8bI/lSaRhztdpWJyIBGNzjjIpWdXI=;
	b=aJSWlUApnolJZfm9k6chFcXSfs/vQeyMpYdMR+7WdcO0mSOE+ClKq85tWd94hUAvpR3+
	 eKuiczYYzJgxMEzj8ZQhWUYZTYQUPXo3M9C+7TJF6wnKH/z/TVD/K8l9O2WlgmnWtykMh
	 zYpDmUs+PNrCGlcqe8ManLpR4q/o4sY7QF9KYleKcSmsUKANMxakJCShRYh7tdhYGeKNN
	 anHYAzT1PSKgL/qFy+gWdRE7n+VRE5N9Y+8C16trCX03GWfHVSphM/DeNCXMbe7gEUvYr
	 S1TqKa0XjH3ZBb0fgEeJDZXh8Vjv845nOOqfTm6aA1k/qY5JRRZTQm9l+IU6KgIdeEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nmspqwe1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chZ+TAtF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04236606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04236606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nmspqwe1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chZ+TAtF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5kkt3015972
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ScjAysI8DSUS+F8bI/lSaRhztdpWJyIBGNzjjIpWdXI=; b=nmspqwe1evtvHtRG
	xBo/HHDJkLRvA+UYlJHq9hBB4zxxK2olD9A1xpcpnw0E6GWlaQyNVR2MQjlA8+Lm
	AyDXBIfXGDUIdYn2i58t8DKmXxQkvXCvUlZL33Q6HryH9WWsVrwCtzdnH9B9/13k
	gCBwscQnZ5HNSrhagSICTwDYp1YBmbjcgyicjEDGo9XtwMJIli2bV324CzKhLza7
	Eyrg3DjvPQhZzkNXYc7DEDarF8IULSXHP6+rGCx0ozrvYzmXLenH48f38cpxchjv
	lAGuppfbcmAPWU7dKPFN9kFtla9maLtFQj5zVQ8pTmdQ3RjDGSJ9k8aCvzG7gRUY
	bve31Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78het-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:10:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso8470485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577430; x=1793182230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScjAysI8DSUS+F8bI/lSaRhztdpWJyIBGNzjjIpWdXI=;
        b=chZ+TAtFUH7j/UnROmsS/OOQ8WWj9kXXKsKraqSHcs7JOZZkNYDEYrkk4Z3Erh5H5A
         sJjaL/rv5VRmrK47x0zMJ5+5f0u/wwMUTymQXwa56Og8TCFjsR10v04B1dbgOyf7/UbY
         TwFjy5T8WZcWRM73Igyhh6nKHkMLIQy2EFRcQhGJw9wo61epDMkRZOxfriAdaHXbVqrC
         RAnCJss3w9d/3/L7mNyZpdBbiRqCA8Nhu5P/Fyh66UWG+hZsnVyAgJ0ZEJoNFeazeIAm
         p7WAlfYGFY01mx76papDOqDt9H1dTjIxk97ahyTle/7uersjDflHdaYmY7hvQ9UmiTB4
         mlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577430; x=1793182230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScjAysI8DSUS+F8bI/lSaRhztdpWJyIBGNzjjIpWdXI=;
        b=DVsBwFopfJALLmGuJgyPwnnCvaKHNm9SVH6qem4TrvQ5wfS8B4C1+DEbb+rkDJEKAE
         ibmSoEDcZQedfroJXkUrsxTZUKEUMfPm28ThrovLWaqHYTo69fKebeEB2YGNGR+c/VM1
         vFAlYhvgD2yniPc+N167yaX3D29HCQKTkl9+fmv7x6CU5f/gJrfJxPg27V2hyNfFVi25
         CfA62gbsjUx8ooGyJTDOQDKJBJSz12hkLLCFQ0BwmVE/6GAl4Em1AolyE2dgq/dEMx2w
         o8SxRJStsBUC9H3rg+8F1j3egUN06PJMmERpgefYVIWKzsw+1+vGbHphqdhiiFKlwrSt
         j2nA==
X-Gm-Message-State: AFq9FYLPCUPUiocQH3uZQOHNKw/maJSI65tqnzgw7OJXpXvAHiwwWbtf
	NclH9uhD+Jajwr6lGGCjIAn8vzJ+ktkCW5GoUF6ooXpMccVEC2N4ZgmuTc1u01VR3lJqNCp6eUp
	oKwnBorCvBxuqkrOglsjJSKZlSrIz4+ihIf3RlmOIp45jxo4BbEf6/ndOd/0DqUJTIn+F2fLc0d
	S4Tjc9/w==
X-Gm-Gg: AYBFou3t7C3vLlCB9VObNhKj2EFoco1YFQwdOA0NBam2AHruUihqO9/Nn06qWOBBXfq
	vk/ddH7AHs3oVnR770NeguR+/q6AK78BCWsFLexwTRxqNEeM269h9DA/ToLhUk0NgrGsu48JmOv
	rcd41z/Cx6nghWb/VyWPFPu9xBA/va6ec+b4AapfV/PoV9kUPAVkAdljrWM/pTWRx8GaMB9cC7l
	cZ0bPCRFkUkbEyeQ72ibn7jrR1PcAOEaqr4LReJkERRnTB5wimZu/YF4x5QWUKhB8qN6KZwN0QO
	cDG/E6Y9obWId4XbqQusOJdE4rVmKYqiOO4lYknhX7I6Vi6zVBNvwrDB8Et+r6oufIlaVuOtS++
	QzdPBpyXpXgVJ9zaigVyBEQ==
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr356251585a.6.1792577430277;
        Wed, 21 Oct 2026 03:10:30 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr356247885a.6.1792577429799;
        Wed, 21 Oct 2026 03:10:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c467900818asm61438566b.79.2026.10.21.03.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:10:28 -0700 (PDT)
Message-ID: <349feee5-32ff-42f4-a3f7-8cd6b0d9e750@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:10:27 +0200
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
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Fix 64-bit address
 truncation in dump and translation
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
 <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-1-f19b4b947bba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-1-f19b4b947bba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _Anq1SPvIn3HXC1OgSaymPS2CEW4WcNs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX3Khl2qm1TuDQ
 YscCwWI3861c89ynx80mm+saXPSAxGBSWDD4KNW4k0aEvSrmSymEMVjpJHBKyh8VIJEouBI8TxE
 d6Kjc31x0ajUPBWCweMrTT6M+MFPZTlg0wOMfseTThF//KZ8OTCpLzuKR3hBrLAGYzzfm+REDWa
 Tk587VQ8R5m8pDgOCAZm2VhRpGN1FamzlcX3Qpy6PAZqysYV68PRqIZhjAnHwtif1OnZGCyBZR2
 7bD2n68GWyn0IGOdUPNzbOdOI48XSdUJVh0+HhcJ3TkCLqkEdlIFkyIJmdHd6SdacOuPXkz+JJ/
 jFOXzHBkOKFHmT6/crzXYCVh+fCwJJAiDFDWVOhFXQ1BKHmy313gQ9ZI5CO3bLmxHCuAQwnMIdY
 psF7GWO9iWNisHBUPrs7kWTb48HBeLNs0r7UJkVZ6pnSBnDCxtm6kZM6UtB9vCOAiaj7uH+L+Fz
 mVf12mmh2RtxcF//FqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX74DUC7P9VC4v
 1YoD35a/GBKVEH7XGR7k0EWI8eMxm7/QbPDmfgQH7PMDbbNf0e+j/uQXma5TJtNzy4MIa6BpoKN
 +XM9hlME72MNmh39rPb+OVRRFfPce+Y=
X-Proofpoint-ORIG-GUID: _Anq1SPvIn3HXC1OgSaymPS2CEW4WcNs
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad88f97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1FkldgVRT0rVbtvJ3NUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 9/21/26 6:36 PM, Anup Vishwakarma wrote:
> In qcom_pas_segment_dump() and qcom_pas_da_to_va(), the offset
> calculation results are stored in signed 32-bit integers (total_offset
> and offset). On 64-bit architectures, this can truncate the 64-bit
> address arithmetic result if the subtraction or addition exceeds 2GB,
> causing erroneous bounds check failures or invalid pointer translations.
> 
> Fix this by using unsigned size_t offsets and explicit comparison-based
> bounds checking. Check that the address is above the base before
> subtracting, and use the form (len > mem_size - offset) instead of
> (offset + len > mem_size) to avoid unsigned overflow.
> 
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
