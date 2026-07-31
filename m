Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49EC35AC01
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507048; cv=none; b=HaflZq/V+V/XwepGmXiksE8+YmxT0v8RDXm3DUAL6XWWBUra87c+UwR54D9CXPZ0D7TA6b5SHzp8VAPngEYch8tgvnS8gJ4yo4RelWDWxbzr/mM3rtiB0eaXbVArWv9MdCJ8c4lRUCaahsmyfEuJorXao7th16E/3G9CSI6k0f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507048; c=relaxed/simple;
	bh=/7KWAZBYn6MPFsT/KNM9BNdClV7cU8L/90QgeBsjtag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3lHtP0W17fYAYOnRR06zG+R9VshYFC5+0cceucS0F/IbnIYRjmp21Wq/TmbCA0AafP9itavCpyTRDzFbJ3yQm7FNLLXnN6nFBVbOolKtUUZJ1oafEpslDhBR/5ddtPJ2imVAb6AAiSPkIenzWD3lNPdWmwnAqlXotZ8tV0e+eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVy/Ejem; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HapVZGUn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVy/Ejem";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HapVZGUn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBdAO83371051
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6MOxyNJtJk05q8LLyOUg4qa91knVI290ILuxyhKBqpk=; b=YVy/EjemvioqFGgB
	1zdu5aJW+Cm8JtIxWeNdb6BXgKj/82FjDdNu7tQJ7rJSLFFEZzz2eG+aK2ISAYe5
	9YF/Hpq7b2mzJ+2owBXzpzxZ2fNpzc/JQhl0f5eqnvndUo6LDldkHSRGjqdg9qxW
	bDIdJnGeU7jIprLeJgnYLGYs191ngFhH/QP2x3THazbvhO3lJR4Xs+VJpDvmZKG/
	BLnYhwK0PKK+MaP8s9JwtHlWEneKwVfnpqQgNgCgErd2Kfv20RTqFRdn2T0zpOYj
	T3ZBLYWpVHfFw3ghJ9P/6Mn4YZdWLgu9uh+xmB+2BYH+zJfcC9B+gK44k7fDxlru
	sZ8dOA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru0y0keg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:10:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so7653851cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785507045; x=1786111845; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MOxyNJtJk05q8LLyOUg4qa91knVI290ILuxyhKBqpk=;
        b=HapVZGUn4pG6Z6lbEEzo4AInhv4z7sltCAkg34nKBTLd02grfPrpdjP++oPaTANZ0/
         o0OYiyTeehWx9c1D8+HqLlOOQXJoYyg4GVxz5ycaaXgQ7pTaTYsop8nlQsmxQ05N9krm
         9yRVieAMZfwabaW+VCP+L19s3GLtw7uDvyKvLGOZZm5ZMbKhA1phrFE8innLiGGZ07EN
         SpFy2A5a/GAz6oxIKXd1FklWV7ThesA15Jc2To0GGTcOHXnpGMhanuUblvsa1476LiJX
         CsdsxYcF2j0GwXt2ug95CO+Of9kWKmgRPni/tkW+xGyBuA9yuzDA0Xigj9uVml8aavrF
         +vMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507045; x=1786111845;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6MOxyNJtJk05q8LLyOUg4qa91knVI290ILuxyhKBqpk=;
        b=c5H8qfkiEI2Exa6EircUteIYkVgX9PSxWkm90L7yUm2RQGJ1eWC3jDV4lxwmGxiOxR
         28ezv42zu2flwMnMMHXdW5ENjQnC6/ge9BH+Y4jbLBcAp6i+QA43a0jhke1aGyd8ELBP
         kAGGRjADCjU+2BwED9wgsuus9i9CXzvF3rer/xttDRPNScpsV7Optad9sFUzksXepbD6
         ylFgR/yD4oBH1E/3fJIzWr6X5u2iL3OtqQNnDQfbuvYi2lDTvZqnc7j65Ij5MsuK7sf0
         sRs7vK1QAsqNkIBtvxnix/q1Sn/E0cHZFgf+/LP0qRYioLrxk6tm94Lka3uFBNAdKoim
         G0lQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0XqrT34N42rS5ybZmRFpZuvKdOTtfi0F6jZJmZrKdF7iDEpsft/mW8ZMMmGranbuFucNGXC5aSB05DyQH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5WANv5DmzPYqpKQFP0ryf+DR3HX6rQQhQxV9wXeh4vy6ucAh4
	WWm4qVwyVgCBJKxpMHY/v0m+7JNK7oA5Op5OIKRQLbnUuUsNCaXOzBGDAHoxSaWK43J8d0c0AmK
	K0CfPuQWXHJ0PQenibsWBmzjJMsgrgCl/LFp7AGNDOtdG7zm6Fo9qaN/kRQuHydOGUqPt
X-Gm-Gg: AR+sD12J8NKlcskx3s/8vFDrvK75kK05wlgsOd1Y8Fx/m0HhsQPy2BQju2/wtrCJ5GU
	flHOzf8pD3NOMsh95Ua4/E8RNIeQvEi2JiiMQVQbVvqF0LYVZByoi1NbNucW9NfwsFAZchcgjKS
	ITntwnlXYqy76JPiXqEzZTu/61FUZ4BxPZrglr1+q3hs1GaadnzqKKBtRQ+O9tvm2gvXMem9nth
	698kiiMKLdrNYENAj+VsbnZUlqLUFiwX+DGLMn7cMyid/tW54iDF/3yUNHkDjIgFAH34x+y/THo
	QolGqP8oTb3TY576ZUfZdL3gXqEuaLhhKcSwfJzWGmMVN8gLGydujOUZ34loeAtnT0Cc8s5gtX3
	9TOuuZYNBnMvG5BcSveS3HUD7OR0KAZ7AMol1rWZirKvB6Q6my0G7YTgOyZ9esJ/+4X+YOiAMPf
	vYE/e+o0BNmgUXmg==
X-Received: by 2002:a05:622a:4c19:b0:51b:f549:c706 with SMTP id d75a77b69052e-52b566afcb6mr5479651cf.16.1785507044787;
        Fri, 31 Jul 2026 07:10:44 -0700 (PDT)
X-Received: by 2002:a05:622a:4c19:b0:51b:f549:c706 with SMTP id d75a77b69052e-52b566afcb6mr5477991cf.16.1785507043956;
        Fri, 31 Jul 2026 07:10:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23d23ccsm321772e87.36.2026.07.31.07.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:10:42 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:10:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Message-ID: <lawgfdmbupi5eecyplhefyva2b4ukpsucmcz6fjfhaqrk4hokh@tp5fwmz4luca>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
 <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>
 <tsxthwcohhrmwvgzg54drdrfu6tzjeszvpsvkpstocxqr2smkf@j3w5qeo4t5y5>
 <4e948116-98fb-4814-9262-94161925a349@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e948116-98fb-4814-9262-94161925a349@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwNyBTYWx0ZWRfX4YnBY9lzQjjZ
 lOe3etSHX8gHB7pR8/ZD/U+A8gLXFP+yUW6qcKck8NPAIA7SzgF2cuNJab8WvxNKrnYC/8mTWXI
 A8o/+8tCznrC2cTspclVDVAVgtTcp+E=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a6cace6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=zqSJYQgTpsw8YhIThLcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwNyBTYWx0ZWRfXyIpiZuwM0MSf
 cZIa+O6xVVmGXUcYiY8bNzXvFuiy9C4Qdy6cuevqONz1U2mN0HXWzExw4LLwovEl/J/8kUi2ZrA
 n2Fv64hsOqhj8Kp0EetaVGZZbFZGsJC8uENwbBRPaawpUIxgXaFbVlT1sdbEF340QiSbWxtkGDv
 QUNC0vUzmF02RRfPwhe0ZomPnQb0d49iXCdUAq8z4otYd8YqEp7oKuQTaREQLDIN7E4x8ePFFth
 CkkLjrmyvOKgG1ZIb+4UmT2ZqOAUuXCvsXnlH5jxLEUuq8Ar3b0iimq4A4VqWUk7Jk6zKCmzxrZ
 DW34SNJDSVZENq3pLSDhDQdqedeoLrctxP6JhdHcwfVZ5GMeullVtN1eOLFyNlBbHVSVtHizdJm
 xrWpKD53uYCdUCo3YF5w7d7aLqhWDyzFEbPBf4wJzkH4inaQ3e3QPK/M030lhWsJDDnzQrECn2K
 gt6pK//oqmXQJ/7/9Nw==
X-Proofpoint-ORIG-GUID: fn7W1jv7eZI456yBZrdE-i_rCfv5dnXZ
X-Proofpoint-GUID: fn7W1jv7eZI456yBZrdE-i_rCfv5dnXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310107

On Fri, Jul 31, 2026 at 06:14:15PM +0530, Vikash Garodia wrote:
> 
> On 7/31/2026 5:27 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 21, 2026 at 11:02:25PM +0530, Vikash Garodia wrote:
> > > Document the iris video accelerator used on shikra platforms by adding
> > > the qcom,shikra-iris compatible.
> > > 
> > > Although QCM2290 and shikra share the same video hardware and overall
> > > integration, their SMMU programming differs. QCM2290 exposes separate
> > > stream IDs for the video hardware and the Xtensa path, requiring two
> > > explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> > > equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
> > > and Xtensa isolation requirements, such SMR masking is not applicable on
> > > QCM2290 platforms.
> > 
> > This means that there are still two different streams, one for pixel and
> > one for non-pixel data. Stop using the mask and describe them
> > separately. One will go to the pixel node, another will go to the
> > non-pixel node. As you wrote, the hardware is the same as QCM2290, which
> > has two separate streams.
> 
> AFAIU, SMR mask is an optimization to reduce the stream id configuration to
> SMMU hardware registers, separating out is _not_ recommended which again
> brings in additional register for programming the additional stream.

We will need to separate it later anyway, to handle two different IOVA
regions. So why not perform it right from the beginning?

We should not be introducing a mechanism (memory-region) which is
limited only to this platform, if all other plaforms will use something
different (subnodes).


-- 
With best wishes
Dmitry
