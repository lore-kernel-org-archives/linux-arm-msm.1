Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163732;
	b=5lUc0r8A5bG3jreKexsnAtxpztbJkJrUBKu50VvvDKqLCZa0yiEhOSo1zX4wimRvLgC1
	 04xR9dix/G+PfZtK+kM/T/dPf/V/JMs6btXThIIvQ6P5ZoIwff6tGm+uXmHKGp1ogss/A
	 2q0L0Qjveehpk2I747qDiQ/3jOpH7VHY8u7wwtGRthKm52cV5wPTvoXIR2dzEVyFTaUIM
	 TN08MdxOaO2iLNi2ikFv4RagdtDC09/FNqNQZXSOj9J6uaxUxMctvlLF8qhhvtabrZ1F2
	 GODfDFGRfTA9V0lE3htZmLVZDGqGtq+SE6QwpYwEI4HxixiqmNYC2jHHAX2YXg8pIeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hBY5wVTqJ0IzIgFA/9FEwfwpYhXNkAYQbs4g4C/IQNg=;
	b=J93dJGRasjeF0iWMvKx6LXM+D8WSY89RCzwFA5xj7+IzRcHVrMpfigFELYecZdrpew9H
	 kGpqYnm9zwcpVguQCqaZcwfTxAH/WsvnWlW9PBBCPddrzWJeQ/2eYANfXPWEbh6J2gNnY
	 Xm8c7mjoN4iKUuTO6ex90Y4/6Uf5nglyXK7gPSyRO+qAEAJOlLtYLAYlCir0ogHbuJ+IV
	 fonW9lKFpkLt0XdQ/MA4Bpgoxmr18Ng2s3HHyzRewHcRnPw0Ed6VjVIJhtGXm6jVIOZnc
	 z1nIxrXdPY/OCdS28xfaZhRvukbUPG5k/EdI0qGs3e6tm2zyL3f2N2QEQCn4m+tDDqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NZmEE/Xx";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=amV4y0AS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AEC606A331
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65AEC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZmEE/Xx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=amV4y0AS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f9751742339
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hBY5wVTqJ0IzIgFA/9FEwfwp
	YhXNkAYQbs4g4C/IQNg=; b=NZmEE/XxcPjqXuV5CWFQxRpFNKE5Jr10PfurHbgU
	FkVtmFV5oC2/TEqkyHAC9uacgbHh/U4gMIyBInbpDvbGxE7Fid4GxDjTDxlfdwn+
	sbaUa6uKJf65NsCo+ldpcI2Rrmxu18X6mzxbpcpjqOu2jEgmicgVkmFViNyinNf4
	Ja4ek4DWVwvopZzZA++XTY6q4ldMaQAkHnz0IMR0iCfkMRtAbQgDnerHGpD7dxjP
	7XnahJra3byw2uWD72RvpwDS6F9s4AFcdv7ApjQ5OqsY0ASKBJphlDt3D3bmXQRl
	Y6N4V0f4gzDoOmjep1s/K9FH50bTHk/fRNWHUJqQFf3PHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4ygx9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:35:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495c71055bso155714385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 00:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163730; x=1795768530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBY5wVTqJ0IzIgFA/9FEwfwpYhXNkAYQbs4g4C/IQNg=;
        b=amV4y0ASfS35BwlYJQE6/A7xxWoWhZOUitXbA9gtgENnAYfrwzxj4JZqqwQf5d7nnD
         Dj6dwh/bdlXVMkvzEAtxKbidxvBbbO1JNtOPa0nUvj9o7Ip4C0s4FPT7BYOJel2+cWOv
         yng6nFGD3ZkAb1FsUW7wjW3gOOPZCv9AaYsLVAw+kzZkmYy+1MN9v+QKhgUVTpwcbw+S
         gBgJ9wojqeSU5bWY6GNckJ4XwVNRkBJMd/gDJpiaS5B3Gu7gRosf6uPbFlMV0Nxd345L
         emPKwpIgtQ/OLQnwfuWCCo30q2fxPGC8nwP1VEE0H+4xjZxFT57NZklQAnSsRud+0vmn
         +yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163730; x=1795768530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBY5wVTqJ0IzIgFA/9FEwfwpYhXNkAYQbs4g4C/IQNg=;
        b=TIkh6we4ADgxkStYFhsORP4YwLrN01pcGks/iKgEG0K9MU7yUmlxqgMs8O9b5GmN4L
         6VETw62tyLyDMpTSxPxZME8Zs3hUtFjqG0jghsUZuyJmsg6FkCbFCFfuI8n4qsHn2GQI
         hBGPC3sAUxiH2/RITqAWZp42rv31M1aPiSorbfT4WVxyFq3qKGWUGOhpokMzTOFqBwoL
         3jkCDxxwIzhS8WIthMvSk2eYFlzTwXTlh5fygfEy2KYGx+d2MqHHrhLQhoLnGcrs1piO
         mKT2C99jynDU1AMgHc7sqQjKhdsBh+fl79JczFog7Y0QfImWgKgy4epykoj5k0b37odW
         2MIw==
X-Forwarded-Encrypted: i=1; AL+hErGev8abAn5zKNPkN6ktjnCdFOb1dqs03zsBNqkzn52uHWL/RPtyVjNKzGdfDrfhamx6LWTV0xMQ90t2+g3K@vger.kernel.org
X-Gm-Message-State: APuU4Z+YLo6d9HWO1xDB9rvSf2f9XB/96483d2hEwbbolFieqVy/eWo8
	4PUyUWE172ohnEgbAt46uRXPZpxsc/rm6fzckYMGYLzRCNPiL4t6LMgq7HSx1vGYtARRZpQ2X8X
	FmlQiZ7YUSr8eneafyA7aKHD2B5eojTGtFrSrgu+1OqxSOOtqyazicL78n4N8cldNMGLZ
X-Gm-Gg: AYBFou0vTRpL6VIH0af6V4Fe0/UDYXrCbQWhoFiV3vL3baGZiBcZQOkRbTGExxmmQFb
	kAM6vmhKgXv1cKaYGdhvuCoBVywcCg3NmdPb70VCpkPOCg+YC8ZEfu5hMB61Wwaz2rVkGLvrDW+
	ZFT3mKgNanmHadRGe5u5lCT6KGP7IVrbnHSwKS9YLcC4J+B8gkVaBJCP7CfHNx+o6TPnFd+/aOA
	UYCpUudr/2zsUJ7g8WwxgRftaEONJCW9pPNDYttFA33MG1uiTWWkDswMi3SHKZJ4YUzzFYCVQTs
	D5W2HmY+kk02zH/15nnoQ7SbVAw61yCuLQlwLrk5ZZqYiZLzLK2SXI8K/unJqOXSC/FLQMlWaVK
	R5lhbzAR7kuUgv5rd4djvBQ0BDhIhemBJSS0AaNj2AfDl4MW3VDi+NcWHptPoiDX9
X-Received: by 2002:a05:620a:4443:b0:949:7118:47e3 with SMTP id af79cd13be357-949bab4d96fmr378869585a.58.1795163730236;
        Fri, 20 Nov 2026 00:35:30 -0800 (PST)
X-Received: by 2002:a05:620a:4443:b0:949:7118:47e3 with SMTP id af79cd13be357-949bab4d96fmr378864785a.58.1795163729507;
        Fri, 20 Nov 2026 00:35:29 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm3967531f8f.42.2026.11.20.00.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:35:28 -0800 (PST)
Date: Fri, 20 Nov 2026 10:35:27 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
Message-ID: <infkyto252rc2ocolww4ihjuptd5xg5qcjtkft7gpyssxhp234@4dnragxtdfxm>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
 <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
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
In-Reply-To: <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b000653 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=YOuP2q-gqnfq9OsU_fgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfXznj0EHKFCvyi
 KPbQoZSpO0QS3H459B+Sb2E18pdaA7XU+Gfa+LTCZG46BpQcMOYfFH3vVwQzQZtmT1CQY3MjCNb
 O82v1VylRIS1VrdA0bzCi1+t/E/oK1XjeYFfNu50Ubs672wLYpZwOr70iq7Dqc61IJ+HFAJpqCQ
 uul/8j61+TiyWZnAWyTQaJlQBTmwULY/OD7SqhAx6IJd8O2XyC2JKEP/2Ejj7+8dcvwk8coubWo
 IAAc/EfDrH7e+4G0ug2EYMXryr/KAWAobLrMz8dOmZx4IItGtoT+Z8wcyEf0nXj5uHKaAfUOjto
 Jx0ecfVigagLL3zV0w4+ONkryPbsjNPkWUM14tdO3bBLmLsA+VgAvhGaDfKYaeu98Yavzi2UGbM
 NbjSGLyWHl8sfUZhFCHAxr64sc5fYfoHT2Ejen9Mhv41TL8wEYMF65MKhyB9SZoKlMPcbLAE2PB
 rXK4jZrwb7qRF3CYl7g==
X-Proofpoint-GUID: iY3_WGRSrWXVf1QFENjTHzRwpQ2wSZGb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX2w4/PC/XjlXO
 87bl0eYNzzVPPVliodsBpqED8VSuroU8wbYESSXtMUH/1/peU1Wxrv25c5/JunkgmXzgz1Wfhow
 xNkWzAiNoLMWN1F6d4X5rpUYoRDCugU=
X-Proofpoint-ORIG-GUID: iY3_WGRSrWXVf1QFENjTHzRwpQ2wSZGb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200033

On 26-11-19 10:51:25, Griffin Kroah-Hartman wrote:
> Update the node for the DW9800K for correctness.
> 
> Now we correctly select SAC3 mode and enable timing-control with the newly
> updated device tree bindings.
> 
> This is a breaking change for a part that was previously functioning,
> but only due to manual register writes in the driver. Now that we have
> the correct documentation we are able to update everything to ensure
> functionality with other devices using this part.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

With Fixes tag addeed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
