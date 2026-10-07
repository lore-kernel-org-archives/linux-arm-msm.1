Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418AA4477FD
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 07:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359772; cv=none; b=l824amlIgUDTTtagqUHpBYthz86W75Cp7fJCkWQmL/u+A6KZA/67l+hlp62KBf5bwLAzcxT1kG4haWU01AFLI2gcBpS2GItDOQRl7Hpt/ob/VYSpruvwndqFShQVYYkRksNa2nFaWDcd9GVVsSUZDb1HdtnfbRa4CZrqZN4ZETw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359772; c=relaxed/simple;
	bh=IuXpEauogL/St8XNKk0KwsM5bjJdVpTHycJAZSQn2z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BwRzsTUlJYjdE40tPDBjoqcMi79NLA0B5Ry39Z7GVXDEHpDPnBNkSheDX5KMJSHRxSvOhXB/vvYyAclGeEW3badSY5Mw1SyQmjjg/RAP462OBKAKpYQub8lZBrsUeN7ePTotbENmv8vJ+6mYA4P2wxbLoGgHBJEcyAg5cNmT5Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcHs2lAb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QDAVtATv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcHs2lAb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QDAVtATv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jjVT2970129
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 07:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZ326SmaFiOj+nfD4XJq9xzpEa0pXi8pa+upEE/mPc4=; b=bcHs2lAbc25P41fR
	eltkj+WGOA0fRD+7F7DbOrI1z4AymXUrkNLC2mIGn5Rh3iwxXHcnaVxmot08vUg7
	gc2q+RSffPMvJeJstrDGTM7yc+r8tBVgvDDqH88ZpawD29SphH859Nkii2XhJu+x
	HWKP7DQxj/9mWQH63LTsAs0ZgkbIWoKjA9ZMTR9qRwU2zoPnRN8S4KxQlseTVm5U
	3478jpm1b/bL9ODHmsvP8dy/bI3PHzRmQNr+80eBM8+atJiGgSmZLGZzu+AbxO6r
	vR1YMUlVU0XWfG4ewbGHNU0mL42pk5VaSsrd9CLRaUfHT2HU9/eYGV9r3vBUlWKv
	BhXMEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6794jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 07:55:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca4a2b9c4so832018285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 00:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791359746; x=1791964546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZ326SmaFiOj+nfD4XJq9xzpEa0pXi8pa+upEE/mPc4=;
        b=QDAVtATvsgJIXsla+CTzXR0oh/OcydgVNaq80yacMlwMC+rdQuOj/ONvSynubrST/F
         bHFAsqkFQvD+DLDVg3yNmBhM/hI1WItXD86vdSbAB/BDDhgSfS/OQwQOP86MO9yUlSA6
         tjJSExly81SyISoLPg3+zkextxjCYic2iH7UOIhhAY8mTaDAJTL57vhQ0AVKdhpnmSOi
         SUPiveFfU0TgTJo7zvYVzzYMWiZ1q+9U9ZU/MgxNLB0vs8pEegT9JV63AZTXjE0c0GWr
         wsv3VvGtpiqq5Oi0b315ZSgG/vls5nwWKO7Nf4wY13dGf4OvLVrPfX50E+6s9JNDpImI
         EnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359746; x=1791964546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZ326SmaFiOj+nfD4XJq9xzpEa0pXi8pa+upEE/mPc4=;
        b=CuyKpehzV7mlXDjYqd8Pyn9VNsSDCiCMA3e2ZSfXrDgJiygsxBht2Z1o/Cwl5K0Sid
         mf9ZyU1nM8UK+MRe0UjkWkV00NClqKy+59vzz509d8Rd87JEzGmfPkHohfTPwn1SsENo
         izwaHepFL9iIRiKBl2yggoJuEBCXruKVjPxbKhVudivDrzBNGexZf9EnGZaPmyAJG9Q7
         JoZbP6pjnFw19dFbYnZJVcmCS54vJTqJKEOjxudO8fsjutOgSUGu8osHeJulig3SxDeX
         eeGoRDXwz15xY3O13+ck0ylHHCnSeO0ntbG3wT5atQ4M+OKiqZU/mHCq3l/ocyutbl1X
         Qjdg==
X-Forwarded-Encrypted: i=1; AKwUvBysFUMmAg9Z8RbM2EmvRJTAmtf/8p5RbMU6zwoDJTXZdm3coPBHBpSRwJxmrjxeC34mBNzPdiAN9nbMeGAB@vger.kernel.org
X-Gm-Message-State: AFuF++kbxMg+cewVOopMTgNGsFFyibuP7CZbv+/qp7nX5dW18TDhwzUc
	vJ2beDgeZNFWyOVwU3qva6Cw173V0sqzdfWH31c0civU8VdeU4DSu3xN8QBt4OEII1Ur92Ik2yw
	+VMlGcXIT38r+yaIMyKv+/4PTcYUvAq9XEaIbByVt5tpGXAcnLDTBys/YyaReg4gYni4C
X-Gm-Gg: AYBFou0FI43tZlNYU8UP0usbo5JI7cvbJYzCUWvs6AYuegcasaqsTx7iXyD9USm+e+x
	kLHpn1UOyo6Z+HGvnCUa1kkqkA8i/ADZwA640l7ISnw+4027rr9ZbxInjNgmQimuTFMxdBB8m4q
	Zr5DS9DVL4aWaWjCTjCxeX6i3mlLRzzTe5TNAB2U9oWBKezAbU/Gl7Hpow9dZzVV7qeDoStZRWZ
	UqWD/BsvasBjZ51u7dI6Bzno9CueuF5t3BGAJisKXzqIs2h4r4UswQ50WplT8OkKVQAJrQJTJOY
	MFJE2TVsTYeXfOj6MUUZpqCrRtxJuP1XgwgQdiVD+EVF17pNxc3LfSc+ESOg0wT/pDdR9dXLUVr
	IyC7iwcmAe9X5OvZMvjCYhmcas81Nv2ffMO19VB9U
X-Received: by 2002:a05:620a:170d:b0:93e:96e0:25a5 with SMTP id af79cd13be357-93e9b7bcb58mr298385485a.41.1791359746039;
        Wed, 07 Oct 2026 00:55:46 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:93e:96e0:25a5 with SMTP id af79cd13be357-93e9b7bcb58mr298381885a.41.1791359745579;
        Wed, 07 Oct 2026 00:55:45 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c50f54sm123186815e9.10.2026.10.07.00.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 00:55:44 -0700 (PDT)
Message-ID: <03a9480c-97f3-4ac4-9e65-2636cb51b8b1@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 10:55:42 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/45] dt-bindings: media: qcom,sm8250-camss: add pixel
 path variant
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-5-gjorgji.rosikopulos@oss.qualcomm.com>
 <cfa0190a-bfcd-4b09-a5a5-ed4980b16db5@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <cfa0190a-bfcd-4b09-a5a5-ed4980b16db5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMSBTYWx0ZWRfX+gACBtkdn2Mi
 uCIgu52ZLrsm+Ipyx+qvc1BaPuQxlD/GPTjBoHB9b7Z8KgQ9gyt7hOwDHJb4TcbwGlC6hqyD8wH
 SmyORNoBCQOy3mUG168zZpuRCq6w87Q=
X-Proofpoint-ORIG-GUID: wKb8GWIwxsgPcS7LBrYBhzUZb6M7vaCg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMSBTYWx0ZWRfX+ZDIrJLxuMlR
 H0ETowW9/wE6CdwawxObyr7TaNx7rcN2rqcLIVsqfCPWgAYrAHy0zekzjVJSoZnqy5oXyFGF+dT
 PP0gLxoeqUiwEO7Y8hLnxuRdbqgqpbrAPX0+ttKjXCbG8wE1YNXgDGUkrgqDKvQpc4C+1nDPnMD
 3vqFjJXDXInMO5jTd3RTmuKge+XgHimDFAKOlQ7gqZ3IcEDhffMsKwQqUWvdIM5GDaeeNEzOX6U
 yRiObw2bax/OUxkzohKSmDdilQO9Ga/iUuKbSYSuOyvREmv2voPAikt8V8LCiFOisyysJB9oypP
 sRiAIZefsrP+YohfvaO7PxodxhlpYjBB6/uvoc2QGdztMnaMXCeIIq8NELMfxbW4zvfRgZlHoDb
 AeZUGWSdxfJnMECYuFDsUWKPeGXmhK5jFHfDiB1lgN2wwOjWaXcL7dcmEbU9R2uUYHi6jwaexN5
 CGotZDdbYS0gGnbSDdA==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac5fb02 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DO7WzgAb8V_MQCx-KrYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: wKb8GWIwxsgPcS7LBrYBhzUZb6M7vaCg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070031

Hi Krzyztof,

On 10/7/2026 10:41 AM, Krzysztof Kozlowski wrote:
> On 07/10/2026 00:39,
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>
>> Document the qcom,sm8250pix-camss compatible for CAMSS configurations
>> that use the IFE pixel path. It uses the existing CAMSS property
>> layout without additional properties.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Incomplete DCO.
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.

Thanks for pointing that it seems that i did not include all To/Cc entries,
from the get_maintainers.pl. I will resend the changes including all entries.

~Gjorgji

