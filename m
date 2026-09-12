Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADA542C51C
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227337; cv=none; b=gjucRI6Bxc3MjANVIT9KqSBzpw0HPuujmDZheM6EfjvO+UL8ZxzZ03HlB8LwtWrI0BqMjQcBzqN28FWg+/3LohoNPvhnCxic1LDgfKvTiEJTG7QFTp0ve19kZYUU6ikdLh6cLfsUDkqb157LhkKxkvWQZcXMKpb0Mvru86ssu24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227337; c=relaxed/simple;
	bh=PmM3GuOb4qCxP0wGBV0CweejIfEC62Lw4X6JO3n946I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tasXxBWD4b4Pu2T+G9vazy1jP/Erbr3Bk3w39UCW2foboFuPfVQKnJsp6YYxvZntPFEfbikLsWklW96jtN6Gh/IImguQg1lquui60Ytf+F3gjzEEYMChxdfTEPtZe9cDYmDKT+QfO9ktKu3WguyqZMZFUU2bCVoJu+q4WQLuOps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wj7XlrGu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UzAaZWFD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wj7XlrGu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UzAaZWFD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEe2xl3250747
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4qI7wGsc1uSi/6ECowdkd+fJ
	KuFNHH72PcdaBvULfX0=; b=Wj7XlrGuGHnIc8Ed9CSU3mc1gyiHMJHlIxhH6vyS
	RqK9aaUdtX5VrxLKQZNxnoDz/6xHMkuaFYr1pLqHPQ1JFK4DkoPDr7eEP97jLmYy
	HuuQA9gLjnvCXD/yD7kVE4H8kb+lkhr8YFcba+g6t8kRD9fgyyfYuiAGUpge2IWF
	H5AHtAc0gvGT5A0HZB2F6kKld9klWxevqc36xdt4BQkuObTlLAu8AISszhcdW2A+
	qdxHXlsc2HRWttiUot154Ic140O6tCw2Hl3xe9AlLBaUaP2M4DOYpdWehV+7K82U
	yGms54+OugQ3GWYP2eAe3Ti39metAUo+ZQKZV9hpinpPOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c18yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:35:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f248907fso137875585a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 08:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227328; x=1789832128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4qI7wGsc1uSi/6ECowdkd+fJKuFNHH72PcdaBvULfX0=;
        b=UzAaZWFDEk47ieUS+YuegD/8S/65xElp203IYqhkiQ27AidIxkU8HRVKshr9IWIJX8
         EIK4eVvjUpSokb2Mu/vTqOs7cPQ6MQerVG/MwC1TaZu5Xi5hfIHYogcVdpdQnoG+5y2M
         o5804f1qhYr82AKIJXwiIABRk8zjTitk/f7omGMhfiSLwecZe7hHSXYI+V0fRLZV3w4i
         KKMr8K9fFncBw2WJsTZF2XWdrWJlrf9YeIGHBgt99vwsAi7teyRHQuLjWBQeT2jZIhTX
         LiuO1t0j9Okjy/0Q5MpaEOelwjHXPC9nEJSvQmTA6UtYCgLqG/sDKiBYbzCiu5ovsdzh
         o/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227328; x=1789832128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qI7wGsc1uSi/6ECowdkd+fJKuFNHH72PcdaBvULfX0=;
        b=R4lvx27N19GKgozQx8qrbR5OIk/d4nAmMge4XRlnOcwb7K0/+Rw4QXjVxZTR1PTRwZ
         hIG2AyANiv+numDrM6LIRCdkuGCpG4O5Yt0J24Dioc3CLYeiXoLsb/K8Dsiqvu3/Vf13
         LErLzjRCIGrbNls404c5QaXydehTKH4DvcLnppCCktJtUo6Z12pV/gOlluiiyUByv9AY
         lIbgiTpAWPRiwl+tPa0BVc6BrKBewZNVz565YBy5Zx++sRfFPjrz/hv5GtxhPGxVBOgb
         KEHyT+54vW4yQRWgmwfje6jiIHSw3nXICV1vPXWdF8sA3vz9Qns4PgGV6NPnYk8Bbewa
         GgbQ==
X-Forwarded-Encrypted: i=1; AKwUvByONogkw6+OCa7Ch5gMCLsNk6aC668USJUFd0yi5GYLglfBLr5+sTIxWpiS4BOjtT5IvVds52ni1sMlUN3l@vger.kernel.org
X-Gm-Message-State: AFuF++kuxtg7cGa3nPARkG+TwoimAcZYnV1L4s3y/gPhf6K2xCl/I/21
	6FKiGYYkJzto5ZEopKK8gFbX/B+vheuPD5S+LHRQBK/bZwos6zRCvoe6WO2rjJgaRJfeWh5mCq6
	SY9fH608UW2M7VKPmiLg452qLmAHOtXPgNrNxH0iA99HjsuUESaHOAwOwQ1WCbD7kADaV
X-Gm-Gg: AYBFou2D0DGt5wKAjsCz8huaQFzxKm0a+CajHAVvkNAtCIHpmMnAE5StD43umh+Bvnf
	bqoB1lD2+PAItJ/zM9I0PEEWMmvTCPlCS0G0mIH0pItJZDGoByK4NfZ+HvFmkUQwYcOby6Mz0lj
	0P5xd5JOGitp6pY6Vq/WFw86plEdO1+/ikDkp/6icb0W/c577lS53FAtIgwdAwoLeRXfLIb75tF
	MeEBwtW/87dJmGxpw5rMlEWnZLTWIfP7O+W4uvmpgVKZWXvhHQxPN+RtN+tI+nXZgSICMPUA49o
	EFSgmpA+UAgZX7DaIpulLa2FnzsEYoc7HHgi9UkGF+EE3KcmtouTKzpiXp7e8pkexu8UPABfs2O
	BdhvnH6MQuSNhdTk=
X-Received: by 2002:a05:620a:298a:b0:93a:824:ac8d with SMTP id af79cd13be357-93a0824ae72mr390521785a.27.1789227327892;
        Sat, 12 Sep 2026 08:35:27 -0700 (PDT)
X-Received: by 2002:a05:620a:298a:b0:93a:824:ac8d with SMTP id af79cd13be357-93a0824ae72mr390517285a.27.1789227327401;
        Sat, 12 Sep 2026 08:35:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaeefsm163445925e9.12.2026.09.12.08.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:35:26 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:35:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Message-ID: <33u55ckzcs55fq2ioem3sagostq6c7qnrqjjsuapjangrogopk@est27ed54xo5>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
 <20260911-shikra_adc_support-v6-1-e4b2da5cd55c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-shikra_adc_support-v6-1-e4b2da5cd55c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: D4u3a6kBHfwkTgxtnWXLocSFOgnOqzod
X-Proofpoint-GUID: D4u3a6kBHfwkTgxtnWXLocSFOgnOqzod
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa57145 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cnYp6-ZCE4NPyVZBhYIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX2oYG02UFVJHG
 eWojQPt+0yenIzxqYuyMM9sTo0yr6aaSTJGmS88Z1rSBl/31RRw365cegzNZ9yL2V3h9lXZ2xBi
 qD9HmpCBagUo3zoyhItZfbH0XutuBxQYvM2BhU6bJWv7gI0Cf1gaoZyD9ux5z/JdyRw6tv8OzmI
 1oxLCLxYYfcFKBLXL3yjAKwjCg6cEZXx1T7hdoaBuexQMFYTQPJRCrhiUDrnKgSV4J4fz9cP9ls
 c2TQ/AXb7f4zbu61JUyJyiN1f4BYSX5mYAExsV6Gw395OO2N9aFKYyNm6eLC+7G0N5L+EvlIIZg
 ZkddAKcHt24CSlHBHE7YVW31Wz6+DzwLLFmg6a94QkY6ixASvguHqUOGZVGfd7qdCmxHNT4xie0
 P/T/1X2VhH5iBlofIV6sbJFWNRC89IpQCWMGppXEl6R2t7F1pGM/WJBLl3Bw2yP3d9eEXwuXE6k
 DgP/e2xNDStrNQ44B6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX88iuEA/4QzLM
 HB5BRIllxkYx8JDMFytuyse1u5+sfL8PNdvwWSFFSHyvj21jzU0kfciGJfGc77YiqZnlDH8OiQ7
 IQjxcAvpgz2lZ9RjFi9AzMgRMva/b5k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120226

On 26-09-11 22:10:39, Jishnu Prakash wrote:
> Add VADC node with some channels under it, for voltage and
> temperature readings. Add temperature alarm node, used for
> PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
