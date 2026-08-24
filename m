Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFB5438FED
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787580852; cv=none; b=l5YJO/OYIjCo4kF4L/IenmfaDjwmmqibVGvcQza5HBNZuQHkQKOizqyRxQxcmwJSiwXCn2NY7xM++2pf3z/pHJ/LTvWtKq1sNiQZYMT6YL79nKc4CJXjSkjX6AXxCa5mb2/n/FZFGy5T/JAtudkJ7ROwofA14k8WusRCCN4ytoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787580852; c=relaxed/simple;
	bh=mhYZl448uWWpRNswo9mdghiWYoqweyQyKrxd1PpfbAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=polOUhw7im5lfX6GVWDTkv1H7pcBqZNPIR0bMitlGr2Vg1AdVZfHu9h4kxXJBPD3lQAyybYAO1FIl02GU7jCM/9fxmHGIyMYu30MNxKMTK1hOy0zejIpMfbkn3A59BloVKQnZjI24+L/LUTRZzknoeZMczdSjo8TGb1hi0Oge4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z2k7917c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9njbRWO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z2k7917c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9njbRWO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuq2J2479692
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dGO45jutB5uVba66JuZcydmAjt1ozS2kZpC7Ipffk7Q=; b=Z2k7917c5ngvQ40U
	0pbiAOHqZ+Ct+Izj5Ngt83iyj2SEk86tC8bWQeeCpYbLrm5d/SeSyekHbsUtL3if
	o6REcsm+Jg+BCUXVWzqP2BFGf0H5XDA5g/9Uq2VX0qX8z4/oTZ/sU2+zN8+PItW1
	QLisLdfSc96kWogJqSPn9jTx+EAL8Hq52Cp9ozwXU/jAM/QMYphJaQvHerFjHZcT
	g0tTaVYUgjabCg7AU0du3+NNry4gaaMVtN1sNnPbah1IK+zpn+k31yuQdgv2sQm/
	bF4nE32ba/0sHBfOG91V7WyB0LGTg2r/hk5KJjhhQeLEZdAPXMpF2pIunbr5UBNc
	FMvSKw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdsh38k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:14:08 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97752c2acb7so47727241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787580847; x=1788185647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGO45jutB5uVba66JuZcydmAjt1ozS2kZpC7Ipffk7Q=;
        b=U9njbRWOJLkVA8ByRFnKsh4uiPUHCnXFVy5CI8TpN+9k3a7JE4kE0LqrlKPOVV0LmS
         34V+Rje3GUrKDZlwNpU5zpeD4AiDwueeUgwUltLzFxxL9fZhzkSet+TOUW/X7dgtipno
         WQXQ24ducT5v5O3m+D8sqQfFyzt/iS0LObLGgsafYyOQn5iUMrRXQZNtUbabL9Jj+gGV
         croOxkDwQ6CIyrWYrQ+bO0DnLGGOzUPFxnuDISGTC1MBB2qqATlw9YP1sSRC5wmYi3Dy
         6b3C0UapxVKJyHTgOCEfWQxMHtpxWiNsKs/Y12/nuEgR4Mr+K54l1A0Xijd755XrAQOQ
         EPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787580847; x=1788185647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGO45jutB5uVba66JuZcydmAjt1ozS2kZpC7Ipffk7Q=;
        b=TFEA8Qr0bCYCtPuBHDXM5Ok+Gf2TejZOIIrlKd/LfXOyxdUEIFRH4hfXknekpUudjH
         GT/44z2sY0u4d+t6AB5pOe4BULhUVCeTHpWv3SzaHcICAr3/Gs+pkRCO9eYQUcNIG+Y5
         E6G20qsMbEBaOvkktur9rtiSwEn7z4kcKaMhz6BwJWLfhWRc7LwHtuBFLb0B+3IU5Qjp
         W7u5oImsHt/SO8Y7z7B2LsFBVCtG5PTfzKoBTfmYsbPqzsQA9aAzoUGLKWYLPMq4fYkV
         RqImuGeIpixiPqkPbhAAd6HbvnDTLEnkS8I7Hnq8cLc95kYM1m2wWtBsf9tZyAZAAqM9
         O1TQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYysa24g3AxeAstxbAUEMI8MmHWG7F0JvyUlL+XnP0xmYTCkAasgqKbW7TKptGO4ydnB6YIbJjtiOc50jF@vger.kernel.org
X-Gm-Message-State: AFuF++mvinf5DwxNIvd7LdFzUtUHnhJ2/UP8q2flJ0wXbAsY+Wih55ZI
	FicdLAFj5vmx6YMYEHYrdljemYoZc71tsja+cAq68XDT0ThBujKQQaQYKm4gvKjMe1qh2IHKFKD
	ekj39Y58dLWeIESIev/zoySY9GWs4gi5+xAdzvCYH0HZGeGrIq8wXClTzYJ5cDxA9ZdJNjDvR1V
	wM
X-Gm-Gg: AR+sD11b9/DZSEYnhv/3A/L8DAHuK7aYt948AsIECgp9EyQaqKW4j3tQem8OJNrEQq8
	TwukdhEN5aFcMc4H+BfsHpCA1FQacHmwNDTwaUyFa0h7QRic2fYtGSv8C18zGZnpuEIEGK4deWE
	lULfZUDHqznwdnVyZcv8fKAVhaL78Cg0PeNK+Lh19Qt7ud3ENmAcFoR9M7kw8ov1ZCezH3rUxzA
	ZA8X0kUHZL7IKXgTSt5VciA78x+HOqY9k6ge8Vy+dBIOI1jIw+PO1rVqxeEPV1lfz5kp4g22G2I
	jwtZjQLou+v8lcHHGyNjloHpUpJ9hKAdpsle1TYl0ZY1cNB93vjvKwFivT7hGBtuhZa0rrn1k5P
	T5al443VATBRpT2c7AWKx6wuL
X-Received: by 2002:a05:6102:6893:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-77a6433632emr3615574137.1.1787580847211;
        Mon, 24 Aug 2026 07:14:07 -0700 (PDT)
X-Received: by 2002:a05:6102:6893:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-77a6433632emr3615558137.1.1787580846796;
        Mon, 24 Aug 2026 07:14:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1d741asm8891231a12.27.2026.08.24.07.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:14:05 -0700 (PDT)
Message-ID: <de0c106d-5933-41f2-9219-07ebc93eb7ec@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:14:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: agatti: Add memory-region for audio
 PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExOSBTYWx0ZWRfX3yXPImIhQI5s
 nxDG2iF7uqjY8mJCry6VGwumMrhS99Db8pDCtvNgTyqBsPC6gQEuJ/w8vfbcwGyS0GYfJ4vgh/d
 B0NYRQkWZqS4GoAk0ulyEt/iiHmf7qs=
X-Proofpoint-ORIG-GUID: 05aqJXnWs3fPxF9EDb2Jx9wAdANDooTq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExOSBTYWx0ZWRfX6gtMreYLKt45
 OiUiEzessAPtSADNefuPYKhfXmxF3pcONZRUcQki/QXyqQw4Mhf/GxiPrzq6RTtAZ6Wf3J9in9M
 HRzk9egYjXkIo2BDxuS+OwcbfBxNKPuqsvfCU1nsw2GiCLIAQeahSX4WXH17Atpo3nxrPePgJHU
 EbnYRtM6BQOdpSlVKkzdf77UDglQfeUQEdbny0MJYTLD5i77kH9i1aja6OiYoJ8u9Y6zeUCtO0U
 8TFNQGvd8z2bQjqT1XWQLbkfPT4qY6EOYN6Tg50B2po6jETqL+BCCaS95fNrtKbMChNJJPChLpO
 mcpfOb1WkMWrdUDinKwLMKVYFqyADKcy4WCnCmR4xE3MjSrkB8Ih8Vn/2TlVwRQNz9NggM87ORN
 nxKyU8WSVqw/9smiGEMmxlEjiodepFY2UAgC5M4EfHflUgokebf/NEar5BklAMspASQVwqoThLv
 SXbwb0hnsrG16/Lxezw==
X-Proofpoint-GUID: 05aqJXnWs3fPxF9EDb2Jx9wAdANDooTq
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c51b0 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BZf5gTxYMBRh_tcLjLsA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240119

On 8/20/26 7:51 AM, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
> Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
