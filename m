Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281493;
	b=dOflKdymIccDdICgt3tNlppV5lLf8z56Ro1xDJTDx5Z4O+Qt2+G4ry0OeEJZ8ui3JxZd
	 hxTYPC2AtIJzkWZr6YMJ4U8ormfylU0qmXsE+l+V9TFnwOPeuI2fvqdXcE3FtaoGrSy04
	 d+XxrZGibZB7B9oIxWIHL37a82gtBg3NRP6d4bZZc4GANmUoChtdZnMigttqkKuY94kE/
	 UKxcv/84VIEafqSmFS5EzLu2ugComf+LwhH4I1HZh7oKRp9xRi49T1fpErxFwVBBA9iKN
	 y/ry/2XaC53TCxXk1i8yzn8N6pNM5ddMcA6gMdKcFdOGvUF8kn7hD2No2kwEwWLKN0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=03VTQUvtN+Jv+TFLhgycleO7JIZPD71MArYB34m/8/0=;
	b=WKJm6cQ/8kZeEhLuyyZr/vO8dWEFqkEoURYsPhtnagfBgro1eXHYiyISHtJeHRRyF+Om
	 WPPPN/QIucHdSgEEUalCW6Y3+bd6VBFmleYQS5BRbInt2hFf9Dth6uT5/65vlbO8pDfE1
	 5n+DI4uHvSuUCxHRUODDk3D4gBXQI2OJVrZfNMEfDvj6EZ/aPRwTKD6Gx4PPiu8iUdQll
	 +ujv2v5AoF6dqLFNSHmuaZaTcI9KoZaE1xMR7EI+1ZizFsnmocaSYxern0C/R+sqbCda8
	 v8Nmp3I/WbOOao1KOirhX4HZ4Wuc/0/WCbcHAtjHj71GAQBR4CofuyBQX2Qfe0ljq+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=abc2+r3t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iEtsQyEQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5618E606A320
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 17:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5618E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=abc2+r3t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iEtsQyEQ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFa0d5908911
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 17:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=03VTQUvtN+Jv+TFLhgycleO7
	JIZPD71MArYB34m/8/0=; b=abc2+r3tcdLKrXCqaPyBRnh06SBQTSCrC9mVPVED
	/UipiJc2XVtXNXRza1BfPueE5+t1TmX3lvTLfA+EzNV0UIWlPJQsZN6l/BtXzGwL
	tSwBlN3STr79yK/OY980zUhIgQbkXbEQ+itiz3ZYP09ChWFGiOxcIEOHqnAz6+vR
	ElRjN11JGN5dK/0mj+blp5aqe+ILtjw/m4ITVT3hm0q3XujT9tHV5UxLRhaULzK6
	bkGXVgQU6NrtqdGOTyn+yeKIKfC1Fsz5BHvVrDnje88/+dyDcOkdTwOXY2ThZliC
	fYnOyo+MjLIrcVVpZz577yHycu0zZg9cmOPrTIMvXJMztA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h31m25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 17:18:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-947a607ec40so198302585a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 09:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795281491; x=1795886291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03VTQUvtN+Jv+TFLhgycleO7JIZPD71MArYB34m/8/0=;
        b=iEtsQyEQ1El8/D/GwdKuoN9X5SiszsQQHe/v5QoMOB7MAdIjR9PXOFVZa9Ewd8Uurv
         5wFk5bzB7058DOkCrf8TpBK2Z8Hi95aFH9X8R5TEJA26uz5ikqeQyMMudpZa6ulsKmqZ
         M1ki4Mxq+UN6RDVCXJr4eh/zL4+pZbiV2W3AQ8b/iwoaSyTfrPlJsXyHDwmOWoKmCq79
         gx88fkajCQjNTSXuXPdn9zvSCJKXls5kY+BnT0Cf53hgctNeGYXXtocfv6mA/7rZJyv1
         eIvhLDhYsz+nmdBoFu3Xs5IL0wymD8K8h5V7cMelpDvk0FevG2Kc0aejUciBLWdyaYp/
         Dufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281491; x=1795886291;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03VTQUvtN+Jv+TFLhgycleO7JIZPD71MArYB34m/8/0=;
        b=rlwwS834/8zdIXcvxiQk9ZTe0+yPMBX6ubBp/PRYcqvsbGNqJBmKka3cTnf/BJ65ZK
         apouoMI6S8qR0nbMtkb2PwdPHnQIo5yNs11zvy2YQAEDbjrbbMhSNAfwTrly0wSBg8cb
         jooBc+871Zt1Adj1AdeJH3ebfLsavizrDGnbdKyQu9L0Xmlaq4SFYd+VMH6itrZ439qW
         U2FPzvtRmuBNnC3F/icT1Ls157wBxsUhwYu6ktFyPuCEJ1fzrlyd52Mw91K86q/Q1t7/
         VOZsF6RTYBhvt2H00NyyLhIG1NEqI7MPTDwah0U8Y4+lHOXmy1XZjkVodokLk5QPZadO
         dsJw==
X-Forwarded-Encrypted: i=1; AL+hErG4mENQvKtOjGutMLWpSsOVTx2fkWFuhWbg4e5lIJN1fYCRpz1g7Y9R7olHK4hca2gH7cEbVok5Rt1ePS78@vger.kernel.org
X-Gm-Message-State: APuU4Z83017527ln6CZMDUjuoTgfZO6upDuVrkPLBSONnuU3Lnzp1CZb
	G0AVrLJMYbm+VQ/cimUCNPClvfSlfrcGYkZiFQvnoUf3lrllO7JVo0Te11+wFVjCkYCbw/AGY+e
	t00cXf6USWbRIsi6MboeCTJ4dVFnCbDBnusmGNK/V0ckdBgSIFBuB6hflq2vfZ9gsq4Vh
X-Gm-Gg: AZFdTZfumL27DwEm8YR+CN42/be3EIIeD98h38FUp5hDNRcXWCHlquq0CiqXPK9QEBF
	nYWC0yuT36q4RK6g7so8j6Tz3XG7/1JrDtnqBi4CXFH2gW9HWrPkb04MoNWAy5U3Zn0LraGEneX
	7cWb3Z3g9WUZiYRQloFby2Q6G9SrFusNh62Xx9aMgiH/RU7l8JeztK5KnETF8L6biwRjzUujh27
	UmLzMVNyowBZMxFSZl2ypncU1nSYvmvSGLBr0VGT4Ut63eN5/Ij6LEnPXhSrHfNMYhjBaJ1HwPu
	+RJocSREvP31TUxYOv67meXr3+TA8wjVPsKekqSDAQUfyawjkn0vViwkznvHeuHqysxeMeaxnfT
	IZF5i815379cwTWqKxMD8x4bp9Jrmk0zH53k0bAlXsTJJYPz/iu281lLGjLnqtbBB
X-Received: by 2002:a05:620a:4443:b0:949:78dc:f90c with SMTP id af79cd13be357-949bab4d991mr1084813985a.60.1795281491268;
        Sat, 21 Nov 2026 09:18:11 -0800 (PST)
X-Received: by 2002:a05:620a:4443:b0:949:78dc:f90c with SMTP id af79cd13be357-949bab4d991mr1084808885a.60.1795281490526;
        Sat, 21 Nov 2026 09:18:10 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm237635335e9.10.2026.11.21.09.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:18:09 -0800 (PST)
Date: Sat, 21 Nov 2026 19:18:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
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
Message-ID: <x5wpvqcrs7xe5hxijyjvoqlkojmwc4eqbw2su6q67ibfmzjvdz@m4kd6gz3iyuh>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
 <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
 <infkyto252rc2ocolww4ihjuptd5xg5qcjtkft7gpyssxhp234@4dnragxtdfxm>
 <20261121-excellent-sociable-limpet-fddb4a@quoll>
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
In-Reply-To: <20261121-excellent-sociable-limpet-fddb4a@quoll>
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b01d254 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6H0WHjuAAAAA:8 a=AVuSvmmuOnOpfVppq-QA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: G77QTJ8jobL8Zav3zPpWk5tvlTBAqxoB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfX7f9SH2ee0NXZ
 b2B8HMsMIoGFXdsaXePWW+rYtWd8IlWjHz/D7I+fisZ2MK5b7zotM4pSqUejuxnCY/6nlBH/cUU
 A1w2LDuAi8q8BY6FDO5smzF9VCoHKhQgRSvrXxrsn/h0yKpaO44czPP+xikr8rQbT1QSyt9tU+s
 TA5UiHYlwpwNFEjVPJm1oXJDiNtQ9fptT/FHp+266nRFsu3L74ibmZMiOQpiPd0urnopEC5e7oI
 1hG76c3mC1DfSaW8lkt6ZC2QL/CfN18UoxVTn0imAIvM6IZp687ONNoJij06QZqLh2Yg7mK7GuV
 9I+3zCZiqabyJoQkONaV9jWJRFmpuRYSqo0og8R7I2QuM6lEiieGUNfmT9ql0qeoGR+f5oGorph
 9Yok2vA4kIl7INR9SfGnGBLsasI5UvevaPPL0iLuj/ZE1jzWgrwUnxmMy8kwKrW6vL0kob5uYCV
 pUFVjHbKb6JA8YOeJXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfXx9qHVeojiC4o
 8u7Xq8nvKH59pd9lzsDET4nXJjR+TSYg5NjDYTJrCEYOD0X14mVevkfLBMpIMko2W+zG6OigZZe
 8hFpn75WXk7bI4ccKXcLlVwmc65REqs=
X-Proofpoint-GUID: G77QTJ8jobL8Zav3zPpWk5tvlTBAqxoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210068

On 26-11-21 11:36:16, Krzysztof Kozlowski wrote:
> On Fri, Nov 20, 2026 at 10:35:27AM +0200, Abel Vesa wrote:
> > On 26-11-19 10:51:25, Griffin Kroah-Hartman wrote:
> > > Update the node for the DW9800K for correctness.
> > > 
> > > Now we correctly select SAC3 mode and enable timing-control with the newly
> > > updated device tree bindings.
> > > 
> > > This is a breaking change for a part that was previously functioning,
> > > but only due to manual register writes in the driver. Now that we have
> > > the correct documentation we are able to update everything to ensure
> > > functionality with other devices using this part.
> > > 
> > > Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> > 
> > With Fixes tag addeed:
> 
> Why? The DTS if backported without drivers, e.g. by other projects,
> would stop working, no?

Hm, I guess you are right. It doesn't fix a functional issue. It only
fixes initial broken design. So no fixes tag then.

Thanks for spotting this.
