Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFFD51C077
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066455; cv=none; b=cHmmPMyMKRTyaaJ/qHNf4IWZ9skZh8p/dZrKPnS+V8tlVWymhoqS+ZoEY8+RzuaQQwMbMmp+jdr4ZlzKWgKOcVZpfzi28aJOHifAN/IPCZ5d4S9arXMv933qdCq06qOU5bJxMy5ncgOXOSZ4uloD+cGvghPkFDas7pJ6d0USuP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066455; c=relaxed/simple;
	bh=HMD/MqislT+ok015FjFOa4vw40MW8NG2ykoeJZWTAjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMjAibWho8dr2f+lJL9I47u8h2DdJf86t8GkUtJwYh33ifFn4m60Yk36tm0pxHkzoYWxdQSjuM8UND5+MQ8f7KNo+lADtHEonUG4ETVyeojm4QKM1cZGvYUBbdtTUpE4IIahSfv4O6TAmluAJbG6ICRU3+/arFcJEkQr4LwWYoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/1PJQJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bRUNu5l+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/1PJQJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bRUNu5l+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jViG2416905
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XYtBHdvRihuCYgTHYHvSZ0HVA0sut4rDKfb2HC9RDNc=; b=R/1PJQJVIj5pxKc2
	9ReaE1zVz0yl13E4DPBOQjRdtmxFfS6Nm2d7i65Au35ba6qCBoMPyvcOiGC80SdP
	CjkO0zKgQDdI48NGL1JtymOvqxaW+/5yf99LruTdh+P1UX8Zdl+Ch2K7A/B/STrJ
	BBIJ20KsdqDCn54sJDoFKvPlv75k5tLgrR1JlNwmJO1cCL9c0TYZAvaDhBp0um5n
	Ah6A1Mj39TMqKrDQvcn5f//MSpuVMaBUhXGJ5qLbVDosbRNF9K4UdNNshanx+EaA
	Zk6SNgYXqNKZzYdrp7ZjwfpTEJ9FruoOjTedaqwLJ2MUIbrP5VaV0/nBxLARGFPE
	WnqLxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhj0dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:14:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so998585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792066452; x=1792671252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYtBHdvRihuCYgTHYHvSZ0HVA0sut4rDKfb2HC9RDNc=;
        b=bRUNu5l+rvR5aRQ3iko9IS26oK94n4opSENCbxOFI9jknUrZnbuZ3oUDPfHIh3gFxa
         vukOl5v+ZS1X4zPH6anYX/xh8mA0KQIKzE87+w+diiscvD/4acqn3Ixlj2hmkf5xmymv
         T70pFSeTQmD4XmZbT3E7J+2Ep/BWSkMvQv5DdOjD9YEWRZf/MiwjsF4agwmpN0vrNoZo
         TUxqy+BrtPK6+3dJ1mRpPEcjjv4GQiIh+skzkCRC4UimLfNTypIp2I0bjU/AXdo+gy+I
         1bScBsFi1vEh094YJo9odoUmxb3E30L1BCsjRXlWjXEq0c+l7PaJpYw8VxJ+hB8931QL
         kiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066452; x=1792671252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYtBHdvRihuCYgTHYHvSZ0HVA0sut4rDKfb2HC9RDNc=;
        b=QP3xPrPAH2mHXs9sVLkK/q6iFhJp7dh5lGCrkwRxqg+tWTWFJpyh7L9xiRIMKFna+V
         FUZvWRFvn6Bka+u19ihwMjkfWHD6RIMjr+CrnXvkhohoWaGf7ZO53/bQ6No5xC6+qvnC
         MYMmWQ1c3NDwDMOvPUu5dyPL1Bn/dAl3zCogp/5DhnhP6c4TUON4YBxByMBzQwsQpYUJ
         NcI0p2zM4Uqw4Evd7aE1OJIbtw6JM1OUrWmqblOaLihTi3/FZn0kksa/hPqlWgvOxnez
         oUtwa2CI59RdzTKxTnbYqc84W7HbKsehmWm4WnI6dK8Bb5Ff0oM0YKFHZOOXaF311UZx
         nhJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpDRc41gx5f/B2nEPpUYZSba6J+ODCsj0D/Cabw+ur6M2TWtPW3ITVBNhDC6GwWo8aM8qrQ4BNYTkCQ5Rm@vger.kernel.org
X-Gm-Message-State: AFq9FYJYt1cJoNhtBNzXubyDxPu5uQoAPaNZ11VhGEr/AuayWryjIYxR
	+oAos3q42jxo9lKT/5Tq9JYrexVkDqU83NcnD0kqPOXNFuJv7l9n12Ig0do2U+LWWQQyOXcewY1
	4uumJglSTu2wZuXN1pEHXx68lgCH9y9x5FIJKsjOzI5AzRHFvJmvSbMDSsXjU6eiVSk5p
X-Gm-Gg: AYBFou0g186rFSYanwFTz44KSBFkE6HDpakh3IQnqa1lCc16QjZOvPnTpTwpJc/Q6U4
	ZpOjTSATnCQJgCzPXwohNFHywt9ZdB110bju/PJHEhYS+H1hvn+QgFDMZptCnSU9xSfzvLf3sfV
	5TVBP0U4l0t1yjLc/+tXtKGWNP1eW5K/1KyzBuo6mmnAK0g6vCaXo4QVbl1rkEdWugnamUjPZ2J
	hPpF7hTMbM4+rDHrMVZJR9PwZ9/VOcaPeRZLVuuJoFMZ2NWqaZ136Hflf5QhbvB+FOStqmEBLgH
	mlVWvUNWXFsKsbeS0hMbw9su2ImeL5S/D7fAGF+MGa8VXfaBrrKLRdc6hANRp3Heo/WBTjxEwcQ
	ChhiLtuesc4kFYDUEqSiwXw==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr3499465085a.5.1792066452514;
        Thu, 15 Oct 2026 05:14:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr3499460885a.5.1792066452035;
        Thu, 15 Oct 2026 05:14:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda042e95sm116373366b.52.2026.10.15.05.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:14:10 -0700 (PDT)
Message-ID: <95de4517-d8c5-468c-8df8-649827dfc130@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:14:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm845-sony-tama: Add battery
 properties
To: Shujath Mohd <shujath@outlook.in>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
 <PUZPR01MB51414E1C0843688784B069C4C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PUZPR01MB51414E1C0843688784B069C4C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX65x4dojbmggd
 sUQlR1Pn8eGBTy0YLA4qL6WPAj5sRC37v9bv8LBeOCzh1TN0c5wKn1bYjb9DVMkOd1bV2kVhgOu
 D/TDmBP9FhGT9KStdklybYpHfIAioVMjURUzs/HjXwAfDI6Fm2sG6mFGk/+juIJpMSeuv8eGy7X
 VLIms5n5fixRbeXItV7/3xjrmZd9dyfGZrz/b6rDfsQkjzbL/Ze+944fMvx0LDjcekH7nSbx+YB
 sF/eon27EWxSe/BqhAUTYs8Wa4dgE1HojYPQQyaDxXt4T/jAP9v1GdahwXAfMUXit+VyW5xwBYo
 oY82xPANewJoBmRRvrkg0KodTgcozMN4b0qBWLRHFvYbvzuYbJm2/fXpzIBfpdzRaelu+7LS6PD
 sJUM1GMibzSjgMjERlW1Em2oQHLBR2CT+TrB1C9EgcEL8dthenMW39/jx5VtQIiL4rqbkgHs9+l
 ev9Rzi4vT7NkfHdmObA==
X-Proofpoint-GUID: 56rnhxPIAwF-1_ZythYiAl-6mqWXh7mw
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0c395 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YqG07dkmy_oNa1g3t2oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX8OBmc/EVfugE
 DeB4nIIi6mXwMISlZDveo2HAodbobltFranUnHiQIlXQZlMFpl4dU0Us+GcvFJKVXUC/e7iS/rV
 lbjmgjJ6LIn5CvBkz550hkTrkJW4yVc=
X-Proofpoint-ORIG-GUID: 56rnhxPIAwF-1_ZythYiAl-6mqWXh7mw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150048

On 9/10/26 6:36 AM, Shujath Mohd wrote:
> Add simple-battery nodes describing the design capacity and voltage
> limits of the Xperia TAMA batteries.
> 
> Use the TMM fuel-gauge profile values from the downstream kernel
> (`somc,initial-capacity-uah` and `qcom,max-voltage-uv` on the 4250 mV
> bins). Akari also shipped a BYD cell (3056000 uAh); a single
> simple-battery node cannot express both, so prefer TMM as on the other
> TAMA devices.
> 
> Voltage limits match the fresh 4250 mV profiles: 3.4 V drained and
> 4.245 V fully charged. Aging bins raise max voltage / CC-CV up to
> 4.380 V / 4370 mV and are not modelled here.
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
