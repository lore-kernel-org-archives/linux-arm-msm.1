Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2614E781C
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659731; cv=none; b=KAdXoYoTj9exqddO5Pnt+pNx2h0CpHDXv6WgEdIjGuBU1cBhdZatMeZPT0o8Q3lrNl7j2hyA2mU5PKpD2yG8SyNFUM3HXcQN56e6oPgiveLrMMvOuuHLm12qEtqxD18Aa3kdwGlygFOW+ZB/YyHNK9i/0J7ghQw0XwJLDgqxUao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659731; c=relaxed/simple;
	bh=2v0ysIuVepM705l4JTdez+t0WC8E60HNc3XwMqUkUio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9iDxdSCXdAWzNGgIfX3Cxz4HFx4d6jQNvCK4ZhUSADys2HPKYqTurzIdCkXRaYxComvxvTCgQAX3N5XOTyQPpp/C7UHIaX4lE1ZKyEtUmsvAZB2qfNt7Rh+kK+L/lj+Cu5DUfvq4AABq+fayAKeBYjm5nTN6AMHu8tmViWUsDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pX3BBD2b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qjf6OGrW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pX3BBD2b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qjf6OGrW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj31r2777291
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ufweLYnTw4iMO7Tb62UAUdjv
	/zgqwscOalR3tmAiN7Q=; b=pX3BBD2bOtop6r9tZsVPcYwOh7p5C5nPCFFAn287
	W0/Vfg09Z6xlmNMqDqm9O40jGb/SjJCs5nQZJ5WQm3TQussHr3x9zRBqL9RYTdBN
	wLyvqtDpc9E4WRyd4QPwPGrmwuuqUR+T6RT/O7Z409/hZIpAzDudBin3N1Lx6n+Q
	dbXyGmxDnevZenM/nB/WOe9mT9dldsS1DprDx1Y9C8NZCIlERqUOU6wqnMxF0+B+
	w5HnwGwhLR6p1eZ9VS+IVhVY1Ll+v2GxMCce64r4E3fJTxchjIY9DZ8ZwY0KuYzg
	T5qLnCt8qgVEhS73lPdq0RtuUGhtBzu3FQARJtcEbhOPmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m3ajb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:42:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso155302785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659723; x=1790264523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ufweLYnTw4iMO7Tb62UAUdjv/zgqwscOalR3tmAiN7Q=;
        b=Qjf6OGrWER5lW6C2f7hqXiAmvnxua+l2vjpEDjRxDQscOZhTSNPEJoYbZAX/W3KGyz
         Hl75LJYYU+PWRyAdPh1dS/hzUOYLWePGJpqVd9nsvAtcmtJqKFNQD874ypBlajG4H2fc
         qlajWJMSRbxQ/v+MyoN52cG4k8Tin6Y6XovQtoO2yd1uQzRlEqOuSphXs18GnLd6r20M
         ULVl/oMthCOIUBLGyqIG9G7o/JQg0SDtlQ6WYSG+LmE+t4atqod6Wf/U2cO6Ced0fLky
         63RR1Jzu5W/snE5L3y7zwDsKTIRnQn7j3U/qYhpOtD0KuhgMGOHUrTnH5mw+4kBKWRK1
         ovig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659723; x=1790264523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufweLYnTw4iMO7Tb62UAUdjv/zgqwscOalR3tmAiN7Q=;
        b=CCUIQj+XKuq7XlXr1AVB6bxinSdAIwOjr3W7kOL+hcLt21i+H7aOn2DbWJ2LtUhEcH
         ATSF9JXmNCGzyzK3ONLzpas/shK6SjjoOz2048panQds8Op6juNY14iH33nj633kaq7L
         LNOailp+KkpvSPkyqCJKQlM4Q9b/6+iymARtpoXqwXlAZCFYVl5gDfOoI83BkKmU3yy5
         dWZ6loen4/rnify0r0DTenasxdly+RbL6laq/66QTs9Si5tptAd0qcxQhkyzN2H5OcQg
         42CJ0m40WakaR/kEYKvAI+W/kQiBPYdykuS/NBFs9pQ23zzc4ZIFtTJrZdRjTtdac5P0
         1cdw==
X-Forwarded-Encrypted: i=1; AKwUvBziJOjCti1ahTEc4JUVyPu1aOxJh1UGseE14ejMGULXOwMDvxUKqldWbFpCWcXZ7ObqsJJGw7V6+j9bFhhO@vger.kernel.org
X-Gm-Message-State: AFuF++lOqdSYJzQhFWuVABX016BoR+8j9wrIho5TIqlus4WE+uTWsEkD
	KQi1biV9pIClam4le+rnykzNTFbv5Bu6u6S0Tkz8YxSvhA07sm0aWQP4dKe97vytTzpRKbPLI2n
	YQMSB+O2Kyki67Us9z9Mpi4nqO9x5wU6aAxZm5hqbLov5xz54O61ILxfjkvCswH7VKuPE
X-Gm-Gg: AYBFou0nE3R0bguExT/Ll71zlbpzpxfuTkg6buizlRutviSX/3jRXwWeto2b7UqLqmE
	b3IoyAwMXYQzR+6ux9c55VTo0Boc8YaePVcmUHfekZneN/rr63B2Jh1M89WkRZKhwa4I4I26qld
	VMWsfYBk5a4CqsyXZFA+mU5OIU24a2KV4RRv7CqOimor7mmDra/+04Z9d4IMCcpQvQkzvG9hoM9
	arS08KpNRV5h+khBqh82bIe8k5SzpNlvhMakwrVX2sEVTqsiF/Xf4ASrJdwveCboCV+4j3xhEZr
	R6qeDbuMw4n4GfbCXLQRfiHzsGw9fTWRGprhtB0OdaoWtrBzRXsi69OXqO3QnEKWF6ymygUaOwY
	Zj6Fj2RW+nyE4oQ==
X-Received: by 2002:a05:620a:1a07:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-93bd7a0efd3mr127259585a.64.1789659723251;
        Thu, 17 Sep 2026 08:42:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a07:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-93bd7a0efd3mr127254585a.64.1789659722689;
        Thu, 17 Sep 2026 08:42:02 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7642sm14897857f8f.5.2026.09.17.08.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:42:01 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:42:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power
 leakage issue
Message-ID: <p2ehge32cq7tsjx5yg5kpue7hwc4b22zv737wkxq6x6m6uesje@m3ltespnmzfd>
References: <20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aac0a4c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-Z6o2aUFVE64cP8LY08A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: OOBgCD2LE6K9yqSa0r83nqvOEG75NI0X
X-Proofpoint-ORIG-GUID: OOBgCD2LE6K9yqSa0r83nqvOEG75NI0X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMiBTYWx0ZWRfX3t6MkuT0xzam
 PvvAsD5VVj3L7s30LGCbRv7mF+dnYSjbMIao2NZFQl8RvEdB9gacOt9NSGSiJ7+rptzF5VUIJdE
 Xx/KOIpN6i7L0NE5jCsx70RNS051YqYrKDMhNwIn9QkvYmeUl9tn6fEYdVtenNP8OsSiUSI4fab
 QekKB+RUvtvPrpXVjXbOyf9UJEKiLnEtK9TShiTgG8nc5W2aP5o2BV7CXoilbkNOzXkRgnx5DUd
 2pM4DBtwUmb49Nlf6ub5qsZwtaChZh5KKLsX8lwCKIR0rblOctyWwjM38Vtm40YU7HkqARTci7O
 XMRnChwqE5TRycx8w3Mx7EmqsMBntF4xjjksDpZ2aM405v7RCYFpYiukEqVhg9yiMXYFMm/wo7T
 038lNdJFbjzhS2d3k7pndNV3DSh+WR/PvdgxA6f9QKdy7PrfPXB61TC1rMbsxVksqGsAXKYhZ10
 mMUQN9NqOXgPOhSFUmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMiBTYWx0ZWRfX35jf5lojJah+
 bQXUZQwnwU/wg90cjpCzivjm6mTQk0y9N0vaXmMFKytd4y0aAVWl79K9nRnN33wfK2p6YLAHgyW
 7HBYQdb3+KP8NZ4H1mqs1x6oHq62omM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170222

On 26-09-17 15:10:09, Krishna Kurapati wrote:
> On Glymur, it is observed that although the exit call is done, there is a
> power leakage seen on SMB2370 charger (which embeds the eUSB2 module as
> well). As per recommendation of HW team, disable the repeater during the
> exit call to prevent this power leakage.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
