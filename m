Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB3841D65D
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888419; cv=none; b=NbpcgKnrahfSJZfi3XzgLt8jcgpJx/8YVGdhc2EE/oqedKon+G8biEeasptAJUqJj3ppJv0hsXcg0PzGb9+cwoI/C4IUIrqx1DTxTDYKJMrhxzm2BivTYwGuFrg1mKeHWbzT6FVoLeZhQUk9c5hlzAGHbvCbPUnfx3gZ4TP6qls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888419; c=relaxed/simple;
	bh=9MjHeF7ErFNK6uHonQyZhFH/OuZcNA3sjtMwtJ8MEm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsFnTLNM2Fqw7jeLRgQdlLnF0TWwjjqQRyhxAULsDWscgWJewYG6UoLiyOR+2fKf2dGWGgFziHQIvLuBDQYRTtT5GlaT3RXPE1wt4hN3BfWQlePZtfpKJI/9CHC5W1NhYnqtI7MybGFBc/tCMWlrA5JZAAneynDF/B3ESKrAAQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6Hksj2F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KbImXz1/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6Hksj2F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KbImXz1/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADsBc2616247
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cefmGTmnLWPrrcaTO2jO5j2UQPSCkKTyHst9Af9Nfd4=; b=Y6Hksj2FNBwkpwiJ
	pkGbVKM4B/Arhzd5hk8t6O2gfpZxD6MrdEFlYpdVTyO9vgzEbWNqn8twLF50sd/T
	TgnuGQuY9Ipk+lwtphdKbywKDNN5T/MaNBuhk81IE2Dt7D4sBXJskzbfnzmmZTIf
	AXdeU3QxeDdh1kZMF2yD7pd25HK2/e4dXmTozKYuIxwEJ361HTnOGqniFCpXCGEj
	FNOX+334DVxg2DlxUafcb0YhZt/xM3MxCKd1vvJWPrIdPpIfu0dHXZvBfGzniR1a
	OY0miX3766k9iaIbvl4KbtWBcz0oq5KikcZQ+CjH7d0PWaiURp8+vEU0XM5eKNHl
	Thn0yg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw9a09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:20:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so471135a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888416; x=1785493216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cefmGTmnLWPrrcaTO2jO5j2UQPSCkKTyHst9Af9Nfd4=;
        b=KbImXz1/gaxvaIJcCK3lLXXDC9F9FMWfPNkFx+w2/6Luprv/38UN1hPU26H+b7tJkE
         IUOONLYdpOJVJ4nIoRFWPlY75uwz4aESGbPAzyIce9QVVVYh56O6uL35Is0HGqEWLgB5
         PAJoisrmzGAxrG3hj84Tk+PXWmmvTvJoZQeZhwCTxAXl94XIc2Get/KpbScfbhydvMEr
         i90rtm3FHMFJ8GgKZyoEDhjH2z19NjD+vOlQZB/0LBz7KRDs5uBGZpeT06UN/BhoGhUe
         QoElJpMBH+0Zxg0Kcy2Yls3MAjaHaYOy5GVfHrDzicRN5HKsO7/BoD2/c/OjrJ5b8aBt
         p2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888416; x=1785493216;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cefmGTmnLWPrrcaTO2jO5j2UQPSCkKTyHst9Af9Nfd4=;
        b=D0J7Amhi4Wrh44/bpDerAm1ajqjaDAT7c7y+dU6nrQP/fDSuWwcyoHtd9ge+vsjny8
         bhAr1dLYfSAo5vf6ANfoldgoctxm9Tjrh0+7pOmA/4WXIqw/YSU4A3cFqMCFl5cSYLBb
         WTe/H/leVHxUvOF7FS600STUtTJKtm5Zm0jNeOfKU5wlqewtlykZfwljByDaqCUNhonz
         IzeUFmqYqPj5IyLguebtXl9Aq82WxkARmrtsHX2L+LLpZALdKhI0femFpvzdC0wg6r/m
         p6nohz7CocFr98jrZ3mjq8Fobnw2tgWsoTQSzJvIS8AeqjfwRdbWf4J7at6zlHdVU5AI
         r8PQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfuvRDPfUDCuWx1Xn03h+UMsc8TDTc1gJUERPxEzyQdd4Jt9zmiMdnJtBa4R0KeMFLsdR8bDPyeHHkPJ1a@vger.kernel.org
X-Gm-Message-State: AOJu0YxrvVEhHyshjT5uKYkq61DsJgNHj3VwRXBzFzrnSgb7RbOiOlpf
	D02vu7HhYxbOFOHFIdA0XepIFQWH/pijxkZfNsHOk+WxDmyuY7ielS+cOMDzmYZOD7f63hk+GI1
	48O5lMzDAbZl1DSxhbZ5c0WVdF5J/Tlee1JdGXbhWOjXl3AM/X0sO3f+ySHV0GEkCcyEf
X-Gm-Gg: AR+sD12R8sGhh3rf/4/aTXXOEtZN6Pw2RDeX4Niwgk+pIwlD1Y+02O5z6tSw3WTSIne
	/Y8mmxEMC+Jk0x33oiuqhHFE9bTjmz/VBtVGKS7ut8sos9Vh2i5O9fVKua4bOXnWhpuzqd3RIvf
	ueJzN7R9EMuIySD+n18waNm2Cs13VnYf8H5mKBd45XYiRbwtuIW80Q7nzBB8WsbKqXHNL+7CWAx
	W8/BLAh3t50mo0Gh9+i+0f4J4WqHowkigHXQYc11PAg7qACS5uFWl35trOBYAwsTDhVdvrfg4ZT
	UVb8Cb/fVHehEcvTzEhD+77HU+tUCoRVnqxu0FU9+PBoWMYCYlB7XsgPkwEcM1McA7KQgqOyKbl
	TxqI5JrjUPbJRoaypofmqDmX02pic
X-Received: by 2002:a17:90b:518c:b0:38e:b3fd:d582 with SMTP id 98e67ed59e1d1-38ec6657a87mr6559007a91.39.1784888416470;
        Fri, 24 Jul 2026 03:20:16 -0700 (PDT)
X-Received: by 2002:a17:90b:518c:b0:38e:b3fd:d582 with SMTP id 98e67ed59e1d1-38ec6657a87mr6558976a91.39.1784888415975;
        Fri, 24 Jul 2026 03:20:15 -0700 (PDT)
Received: from [10.217.217.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2eb01aa0sm4332703c88.3.2026.07.24.03.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:20:15 -0700 (PDT)
Message-ID: <2ceac8dc-2920-4d29-8ae4-149af2e5bd6f@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:50:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: qcom: Document Nord GPU clock
 controllers
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-5-17e5a445a512@oss.qualcomm.com>
 <amAs6TieGdZwtxyN@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <amAs6TieGdZwtxyN@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX6iRTTWc7J9lv
 KzqwVKbmyCjLO+v5VHQL87SJp6MflKQ/2l6T3KfdKnx/sdK09k8ieB6lgZ7AWzmdVx5fAO3uSCE
 VWbbd9Klzn4m+57CVmyqKO/A4kxpQZse1YDu3nT7bufnnOA7S7foXF4LNRAIja9QYDmb1TzCmnu
 l702eGyUo10AIY2rgDB++fiawGf93g80+Ruen+nX+vXFf770/TZhrewTrGFOP6YzjttIHUPr8Yl
 uElNotNmYtXjIADiohZckKCFaKfAJpzLCeJBVfhoAxP/SHb8mN1ObrmVE2hib+3eJgd2VNBU8ED
 R9FX7eDEVRRjaAKvbDo59cm15IaQlQ+WjaC83ioXOJ+/zb81G2oV/cXEXnzUh+qWI3Oeknm8onx
 /qqUIkUd2im9z3BHNng7SXk1Zqfi+IKgN3gX6UJv0Ac6RXthhgt5a1G4KV2TVZMq+5FM3zOO9BM
 Rl9LReWAn2QsbKZiJcQ==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a633c61 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=zMv09YGvH37i_El2Sk8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: j3Bg5xJSmQPdl37HdO0KA0obIXANRpOs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX3VqEUg3mleCx
 GE5pLVi7XRdh6n3aKRq8EakyqqW4GK5KmRI/yXzw8b0c07jg5pacMAM9d9Owi/5zOQOFMSJB6Hz
 9GLwrgZM65qgmcqQLySRHSNkuLScCRY=
X-Proofpoint-GUID: j3Bg5xJSmQPdl37HdO0KA0obIXANRpOs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240093



On 7/22/2026 8:07 AM, Shawn Guo wrote:
> Nit: s/GPUCC2/GPU2CC to be consistent with code?
> 
> Other than that,

Will fix that in the next patch.

-- 
Thanks,
Taniya Das

