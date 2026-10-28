Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201293;
	b=LDFb66JKDVszSfDLoC7pCJ1CIdC/wUdL5sWmplBAmZ6z43JFHAayGcpDcp5nv7wk4ruL
	 tit16Uh+ks4VJmuBignEYi5J7rECQg+2VfuBOGTnMhUgh+mYztg21plhdidyvI6AeweYh
	 ItTHJlQ/Nn2syulWdm5jloSUr+Zd1O6VUOCWrT3Wi1/l0VYkhUpW+4JDiSr8IGH/BAoF8
	 SKsR+i75ZF5oBNkKLJWy8d+9iLFBtBgoBZEgw7CUdrZaZ28TYYSMZXjq8+tMAPApURPDt
	 gSRH37RCevFTAju6hydrilK3KAOXamG3ms6UrXdD3HV/WM2eZOmOeM6+bI4125rXkyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tpa+XQp0QDFpzE7hdPD++YKPOso0isNfYovif6itICc=;
	b=SHFyyVirTNPKo4wjXFQd0Rvo7eKMsKxsrT5IhL4OBfJNg9yzxpNrcE6NBXld8QMhHSAE
	 bOJEoy7/rDRQHy1SCQvDjDJUZfLfqIQVzaciwbFAFfLBOmOFd1/RjwObsdGCclQISDja3
	 E2zQ7CkKw2DLHUbR/IAXnO/yJiS2fZDZjfBFsJSBYuJmur3V8UJw5rCQ8VMfYBt4KWyvH
	 hlACCN3T8O2INv1i8ERFUt5BSlhSXHt0W2jJPV3MdaJJpULE6n8rPM4HqJHDkFdz6Tqp3
	 30X5SdcJXkjMBPeCRlhYLQfc7LWXoTRPYfXmAJlo1XktX1qR3KZDUb+KYdpR4IZDIXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlQ5B+eE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2LUuQKR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7B8606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D7B8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlQ5B+eE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2LUuQKR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SF9v3E2542964
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tpa+XQp0QDFpzE7hdPD++YKP
	Oso0isNfYovif6itICc=; b=mlQ5B+eEc7Dzq5a66JgUvlZj/cQNxd4cC18+XRSW
	2c5i/zV2QFyO8Xa7hIhJiaYpvp6eBsES4ePVEU8DznupN1OTdBf6CGQ9HFMVL1nt
	CQnG2t9D0nkwT+dET8JjAfy9n1e9+6/H5f7e2uG/7L7z489cZKaKRNcnwNQdI3pf
	tjLSuAYkP/S8BqIbPIwM+HN1FFr50yUfIAN0dNUaKxudRAyKooFM7nmUHwPHQx09
	jmslFQc+gSN7fUGEHNnXTE+mgAW5uP/XA2t5p7elt4nGKl+tb36KcksFMae6ddqt
	8nP20cFo0iNzRrl1A+3hApOjNIlrRiQjiuS9IQVIKMbALg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehr2yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:28:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b206156cc6so25775137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201291; x=1793806091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tpa+XQp0QDFpzE7hdPD++YKPOso0isNfYovif6itICc=;
        b=U2LUuQKRJFlcHzgU2KMgH6TXXkKcGCqVHmWizh7oDkOHpXGZ0sI+mqkd2HkRhBF+LK
         m0GCfSatrQIVYFpCuKkL+Po6hKs2RtTfd1+3sibKRNEbe5WXSBqCWOFBxVb5gOck9w/j
         0LwpDw7wrnZE6R2BA8fm9MzHPl/pXpCwlbaG2OiNFwylH/rzs7/4EhHwfys65XgAYodi
         Qw5Kx/ETmMgEywOHXC6McRtfzayzpHMC4UzQE97JGxClEEeYXOwm6wgKRHt7ZvXSAYNK
         xGhRoBatds5Wo+fQvuHyBGieOTJlWS46j8y8Oj+HQgEyfqFcwJsXRuCbc0Z6L0i+33Pt
         ipsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201291; x=1793806091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpa+XQp0QDFpzE7hdPD++YKPOso0isNfYovif6itICc=;
        b=oSn9pEORs/axnBq1c0hMtsqk0G2rg7dyc6v2qNBAkJlaBqEM7YjaIMUm+cdqyRjuCo
         Y1hP8qGjtRJflSMTR5CjUKhoG8uLEf6l6/Hf/CLdJOjUHG3mwWh72orXNGkqZcNjxWrg
         7iX5mLk3XgDrxhaMshh/+sKkm+g+ej5PMeLV+Xt5hCaraGkaZL4Oku+wj4nUE8oZ2FBo
         Dgl3q4IbxTy4Q/z8YtpUCwnR3VDvme45Wqml3c/loxZJeqm125JrNCtZMR/88Qf6/Yru
         FZ9gjJLvp6F1gk1g6PLl1in6JKaxYywbtXgUEdUvW7y0govCU/nIMOlMiNmXwJrNxEhs
         SGmg==
X-Forwarded-Encrypted: i=1; AKwUvBxBP7dDMZuNJbOnNm059BIu6TlpTglIo48q63Dko7apAaoCucTJMO1jpXD2IATo4krMNTwRBmWlACT7Ftct@vger.kernel.org
X-Gm-Message-State: AFq9FYIskUpzObNzQOLk7mWd94qIx9N0PAHWrCJSxJl0fWBf0XZ4blvF
	8fDce/NpO+SSM1x1qpQjBqrfBq+IaK877KqnB9K49etrrVUI7A5DHDKq/+OpgZjyeW9sTpeHJJL
	lv2UnpRExIYbSGJPUEXPAnuKqdYscSU+BUHgvMaAvwE6xtp1vidtGlLn5BchiefKvYsOU
X-Gm-Gg: AYBFou2ku9lj+NTpr7DnaIvvvyLD5d5Rjd5Dqkhh22Ioj9Jeysu6lWcVlbS5s3r5Wjy
	8tdsiEtSC2gQjqPAYOZJW/96B/qYf+WSfVs1zQ0/4uGg4khFOwbXPbDPJwK4RFgLwfy3iE9f+8v
	tobbw9Au2Fujay55cz/GCCgTvd4PfxDTYZ4C8ioncSYEGg7BwK0fqXzXPlBErQMrrxq3KDmBDid
	+YRyuMfVKxd/yERkb/sCGRRYL6fiHQJmDaHeTnl9SQIPDMIn996sxXQiiytYJ3K1SCHbReZeNPn
	zn9HmwMioaer6nej0g/AWT3yAIA5sHNI50P/IJ8pkxvQGjirb7NBPCxDk+fGItX1EwAOcDG7573
	y2voJoXbKMhfFMBJcLbEtGnF6jHqTUH7s1cQDUb9LkWBJPOxJ2m2mKgPd7f5PUkKqBQ==
X-Received: by 2002:a05:6102:149a:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d03a59fea6mr1496664137.36.1793201290557;
        Wed, 28 Oct 2026 08:28:10 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d03a59fea6mr1496628137.36.1793201289890;
        Wed, 28 Oct 2026 08:28:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm54505e9.2.2026.10.28.08.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:28:09 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:28:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v23 12/15] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
Message-ID: <5uovgjoe7w5z5equxekkmcnqhlmoi4ruuykea3mel63eyyxh2h@ovvzdwu3hfjz>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-12-95f250b18612@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-kaanapali-camss-v23-12-95f250b18612@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: u0SU9MxBy3y1veafHyogxET4c5fkbyo0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX5xtH3HnhWCk3
 TMP9KTlrXOE9ecD37bMv1SIIM6XOoZNjN5pOZF7y9aqe3cr4OG2FRTauvD1sG5Swkisn7h/g7n0
 Feq13eQZfZN/BZdLolBNfMounLQz2GGknrntm2382bsm1wzOyhmie+IVWXIBbA2E25ew0eXofM3
 73Y5gpaGo1qtsnXQ+nHEdEFDM0iN5dMOSuaQRZX5jk7FHiBwjHrRVkAafEqBFRxz2AHtRMZFKZl
 6GqVcJ3kztFI98FjYvpYseU3/P0wt/aM4p16GbjN6u6Sz8blvoVYr5ZNK1ztvlrZJ0r/axlx9sa
 RIrNHi+JMkdHsgeL2Q8WfCvzW2CXDbaqwWalVygrL10ZpTV+kp37Z0qARdY7fF8WtPEjdbyYKkY
 o6FTh4A4LH4SwlwTMDMVDPfz/coYvFlQeIc6wyo/4q6ZvdDXBJIEtGY+rf0jFrBHheo3lpzBk4j
 0DybLlQBy/w7JLL7o2Q==
X-Proofpoint-GUID: u0SU9MxBy3y1veafHyogxET4c5fkbyo0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX0p7WyU604rrZ
 +kWoHecbw68D4/OquLzj0MnXdrBDFfwQFxgHCINLI0o7gdWktycaN7OBJVULS1QJemfs2qWJKRf
 fc5N8R3zHq66BrXLpZMjRxgqVkbGBIw=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2148b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4HpnP7yKktpVlNN_chcA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:46, Hangxiang Ma wrote:
> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
> can be enabled by board device trees.
> 
> The camera subsystem contains:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
