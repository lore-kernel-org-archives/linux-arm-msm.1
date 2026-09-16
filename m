Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25CB308F32
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570587; cv=none; b=OvLwM0qLHHxWNZ8vMe9hOPjoHHjOqRod/LDBiF+w/TQFQhKcYXhqZXmfKHnsqd+JCSeyInChq82A++lTzJv/8ARm9zMv2HgMXfgEVgEwczg1pfFsHBjFoMRrPqtZhfBScnkkVqd0G4+Or4lFhggE9rKnWeyHyHgnVAY5VRMzNTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570587; c=relaxed/simple;
	bh=VsfagAdCpO7zuh4tNDO7idF+JR1Sb0MGyx5Yhvjdf7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTTrFpqKYeeSTz31rXrLjI1H+JhbklK6w9zQkVp7PHOpg3zqXaB4ZDv4ooShBfvXKcGsDXl5gHQ5vSOaAwE3cNeVA+X1VEv4zJ2ZTN1BSueZia4egrhHZN1qKNT/62KsBJyYHKejYBUZP4bP5T6nK1eSs8hU4d7wyK9E4BSCzVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtICs6aN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyGcpZuC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtICs6aN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyGcpZuC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYkl52955930
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 14:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L4EV+wsPbdRo0uWel1+0PVb3
	OnOlF1D61m8N37sjDKg=; b=TtICs6aNSmO2ZhnVU+MlpA4U1Jjt0EJPd6uFB+Bs
	HOYldGUEml+O/8h/icNp7nNXC0kJzB3BCpNM240TbbSRd6dq/uVoUBj/wls05yAi
	sXan+p6BmnNWUDusZbpZrhD5myFCz6qZwOIEafFEKBTorcknhGfz0pVG6uHhYxaA
	LXpwaXO4gpa1vaCm78MpERb7yOzsmZw9aurnQ7H2H6hYz4Qch3Ti5HadXoJYvSrB
	P5QEIg14CuIpv1kOXqi+uYyHPNsq1h6urK+gvJE0zieFRGlzA/JLurMo384Qaf/1
	TqHSc4WZY53g//jrfsGB0sS/hfrxQGFaeSi/fX/R5i3jfA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2rd0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 14:56:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so14401731a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789570584; x=1790175384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4EV+wsPbdRo0uWel1+0PVb3OnOlF1D61m8N37sjDKg=;
        b=RyGcpZuCtZ/uclMuflr/qmCvx7kaoL89v8f07GB8XQu0VfsdpRwAv8bXjGx7McwXcB
         Dpjp7hxrDBCuPIb+2OpNZZhQWfcXyNXsgVICW4ZYKEqNgtGbPBFODuHFWYl9aV2bi6Pw
         5WX17uztdQo9YXzfNbZtzJZ/4zHD5QBtd+n1gvMKVKZkDkYC8QiaVfA/oCT44hQoKMyJ
         F12t2bfFwApaKeipJFzsX8PsKzweMQRYjz/0vyEcUu+lYmcz6hEwyILPmpqHfNsv4ob9
         kSlSMHSIiihH+hRWX1ubQcMqh1Sdr3zkOEdccqHtslxWJcyEPZALOaAH0glr1g6SaZkp
         M5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570584; x=1790175384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4EV+wsPbdRo0uWel1+0PVb3OnOlF1D61m8N37sjDKg=;
        b=uw6ptwImZi2YSa5Mq0gtg3LGjFRqu6a5cye3mfkifZZ0m1p+lLQj+FMlcbmQq0qbVX
         Jjht4DZRKBehOWRnbIyRyqIvQgLAuU4WAGRU2nOM2hj/b9Ryre+aZMD0EBkyPzMGXWDf
         1GxUx48GjofBOUOLRZNtRMc5W/eNfHPQ4uQ0ctMe9G37UEMUCOBF8XGe8n265/IRGU68
         UlJgB41/TDOwu8R5IqVa2myjCZvywhU0iH/oBoMeMMfAcQHtetd7PQl6A1lxJPGrkR87
         M7dDKrlFL3U6TENl266qlel0g0VY1zIBbhR6OGYNHgSD7nEYTwg8dkv3zjCeCXIJwsk3
         /waQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEgH1z7dhol372N/u69aJrqoEUNX6w8fqg7PawMtQfg2blQeXmwCqmR8ix4aSZP55lyenJ46FmZOQRZccj@vger.kernel.org
X-Gm-Message-State: AFuF++mYrN5UxkHcbRBr/PIa0nrJmOQ6WKDhSW1WC/UL+hyu0DE+CiPN
	6Hd2zP/1g4uulaqLlDkNv5U+uZHUxHpmTrdBq3V1nQgFh054YAWqzsUDElA4V8Smco8V4VIVT1R
	h/XH5fydPNQKbX7COff2YSgejRVbh0YsoQOp0EtGeKEV9K8FhrpKoM4TBgaD+3LYsLsHg
X-Gm-Gg: AYBFou14brODgSowMFLMLmw7zIoycu4LYBM4xohbqb5X40wWo2DZ8LXPLG9xerOZCsp
	wtVcqqd4D9RMJmi0blP1B48AIOo6A3+JI/S0gMVT7I4QIVqaxGCYeYKSy+RAdpdv/SZnPI5X3L7
	14T23zyAquFZpFt9Cs+UfMUIwedRQqwIxh+DKx+xGcWALeoQbNcEYuHZ7w7rF125pWS9gwYnh6N
	c9EFx55UzxZv0PLeSHWZxKBP+xwXkYMdsujlb/9eO4MGMPwd3LEVAHARYNIf9GrBZ/9g9lnWmSH
	UBrnTj/BWZG/BNtxgO0QKdU++o6oRET+LTPgvoDylAlFjhJWV7BwhzVOZbU8tNPzjp9tEZqO0pt
	jRTl0C1IaeW2lQmdilwVAhStSisWU4Nj23VbVOLcY+P4=
X-Received: by 2002:a17:90b:17c1:b0:39d:e75d:f33 with SMTP id 98e67ed59e1d1-39e1e4c6388mr6448625a91.19.1789570583942;
        Wed, 16 Sep 2026 07:56:23 -0700 (PDT)
X-Received: by 2002:a17:90b:17c1:b0:39d:e75d:f33 with SMTP id 98e67ed59e1d1-39e1e4c6388mr6448576a91.19.1789570583505;
        Wed, 16 Sep 2026 07:56:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm10149958eec.1.2026.09.16.07.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:56:23 -0700 (PDT)
Date: Wed, 16 Sep 2026 22:56:17 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
Message-ID: <aqquESyto1TY2Wjg@QCOM-aGQu4IUr3Y>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
 <0956417a-f91e-4ad4-8f88-2b9602af8978@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0956417a-f91e-4ad4-8f88-2b9602af8978@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwMiBTYWx0ZWRfX3NjHXZZndjHE
 SXqb4q4LuQk8dvysjBX9Vq42QJhNo2HtHxr0eTMnEl/aiy+8G1w4KvbDMlPW3PseApEPrYpBOut
 I3YDqe/DX7Evq0Qdvat5TS3DaTH6ySE=
X-Proofpoint-GUID: M3QNzQyWRd7kbklKFylUenylStwD_Pvc
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaaae18 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3oXqmhewsOmOp1idTXEA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: M3QNzQyWRd7kbklKFylUenylStwD_Pvc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwMiBTYWx0ZWRfX28VFr1ajlpSw
 PGtnmY6Kk1rIlPUIpjBe5wwYXpFzw2kCzWBhMv6FfAwr1v/DPZ9ddwAGei2yKuGw2uuoKqFO0TX
 ZvhzgWqorU1Jpqe2BBRUDujVabEynfdHAaC4zmLV7lSuxQljLJOF7pmqExKcIGkEWNl5Axsd/dR
 9P/W3qZ6DMfJXYWB0VTpdZZk65wHQMP8vpZ/D/2ztu635DCa5WpiWP5xQ4cgmtNsuLo1i/0zGrR
 e/3KbMFjZvB6SzHTArlwpcD4kDyrcPfHLeUompkvZ5simhTEBDVm1AEYlmYiWjucgFSwniM4kQ/
 C2hz0ZXEe08wrPbInGe3W+SVumxrfGCgEw6Z5VX4dvPzZtV1sLUpY2X3dALY9IApUC/hyZC2R7O
 Th8bgojVmbgzR0kpfLjQ7s6e7TRPp4cd0+ah9QEatmgsV8pU7P5KRWgdFz0j/PUEXB3JhPpXKuZ
 FrA6OJrU5kt2HKvo0wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160202

On Mon, Sep 14, 2026 at 10:58:01AM +0200, Konrad Dybcio wrote:
> On 9/11/26 4:20 PM, Shawn Guo wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > 
> > Add the platform resources for the three USB controllers on the embedded
> > Nord variant: clocks, resets, power domains and interconnect paths.
> 
> [...]
> 
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				/* Same as usb_0_qmpphy above. */
> 
> Hm?

Will drop it.

Shawn
