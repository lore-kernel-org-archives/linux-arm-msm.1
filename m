Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF0032E757
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227165; cv=none; b=Bx+4UNY3sAufTNLQpS1wLQhMhbR39ijd9pe0ro5Znse25HVffrRgYk8RmwdU7JFxwZtWn55slCjbQxtMVszzRXaBtQZYoiehdZX8JmEb8Obdlo062bhAV1fTqq3kZH0a6TOKpu6mXIEl98MjKdQs9DWfWr4uXUuZ06PU0dYd/U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227165; c=relaxed/simple;
	bh=Gj2WKPwaXMtJYToshXOewcWcdTEU6qlzHTUOElJEb54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b702WaP3u86dHgEn7HZpsYJJQHBE8gE4oNU3O1kOSdqludiw42GG23wYOcecc2jBzt0sYyIOGswXT8U3+EXFHOlScJ12w4t+iMuSNxpRYSOKrb/Y8cKm3P3zNz58mORH+fL5W2LBRQ7cJCD4g7ZiuEB57vQSgvJ5a+/bN1aGDH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzLni7VN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9O3Iujt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzLni7VN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9O3Iujt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdraf198930
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RW+uvZMapCNlLj6TCdNZsvYo
	rpF2ANJfi66sX+X8hEQ=; b=dzLni7VN6Q5Y8HQxG1eEpMItzIZWiOXir+NanzuG
	Qt01xqVYtx/hbumS4ZigLS7Zq4RP19TirCYI13qZfLFy3/8On6kV6Dr6xKAcgx4T
	7FCopa5hKjtAy8BSmOL2VXvZTHyRJ1a0xpVj7hDBoOydhbdxN1q9Vi0TSs6QrvQi
	4MQemvDJqmuijA7N6Sr4H9Qi4NTOuTwvP8j5KycsIeT9xTThxQkjfYTMF2T8nNQD
	NnX35+UCwSRDIgofol/c7wSuUMnAw8BX8ekI3LwcvJZ1ustsYxyDez8GIZlSQ3vk
	Wj8eFLhFNWFys0tgKI/MdqMg3/++ydSm8U3qSpqZrm+4ZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ch8uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:32:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0c7126e7so53634285a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 08:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227160; x=1789831960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RW+uvZMapCNlLj6TCdNZsvYorpF2ANJfi66sX+X8hEQ=;
        b=e9O3IujtJKil+tYzVdMOvXHBwxZ1DVpPSLIo34A9uySNArMNFyW/MDZAukIHHXJfLF
         ZCtAo43nNaEssnAs4eih4MToI+JMhyd2lntXWBVVaeUMl9aLz6Pz25x5lWrXmfVXkYJ3
         UoeyHojdTPMEkrcn3s+0OYCqWT5G7Y1fERQn/4QD9+L0sRObdedVRXCvmEs6N1vgKn4H
         KobZDXcjedUhP/mQjvZtWr6kDNDVGU6/jtO4UN+fmqhj/EGKYUX7rb4pkxSD2ioAIiwe
         Jp7ncEjnVpB10I3vxkVRrrgpfV88gDQQ6FQyPwZziS38SxJq5k7oUikLoyz6eb5Jsw/+
         C68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227160; x=1789831960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RW+uvZMapCNlLj6TCdNZsvYorpF2ANJfi66sX+X8hEQ=;
        b=f60CNxK+A99T/I4WBc9/0OJynOnclCLniO+CtM/XICo39mNa/upRw2+pAfKw58tchE
         dERy64TlkoeBZx4thpNFsYtvBcYHomZwUaG4sPobaHR+8Yd9K/YtOioyaVWwElxcIPwU
         CK+an1OueWNIhFaPYz+iUDsm4YmYP47qUInQUU+y827k8bopTmGE/jQCTJFIZDaGz+Ax
         wbTmLPL6QerR8bTmsW1mT0fP1/nMkHWbC5MFZ40tZ8Te1oq+HakqlsfWsxgOvDmk9pC8
         doyyv5Pxzsxc3ri4OSarulpSN0Ewe9OXynC4gNaMrzuGkjALfQU0PPIb/uemr/WVPcX/
         dRBg==
X-Forwarded-Encrypted: i=1; AKwUvBzQuUrN9Gkj37/A8Rv1TUbW64EYbs+BRAqQYJWW7hcwNGOMXsvmYwxN01oG5d++KrPNY61YI6VDm9ldTj6F@vger.kernel.org
X-Gm-Message-State: AFuF++nPtye0uoI8ou/Mcf3dPukYS3ZkHI3JT+4c+YLSrP7kK2l7K3Aw
	+Og1ZASgjQ9BzSOWbn1MTSlunAKvyjxKRf2LNWjdAKOMA9kg45MztgQOjBuutFGl1keQki9SHKT
	hw5iDJUURedOYzNbMjcQVl/Qe4mhpiA7oW/yycB59pyF+0gxyVUl3cBq8zA8eYltlUDkJ
X-Gm-Gg: AYBFou0bw5xiNUCnSdbDg3DEPgkLP6QWEz6RPsMhvAZ9naOqRY8napNooAvDfL6FJM9
	NMM6tLy1ATfwUN+arvsT5o9WTObDf9RNqLXvwURMKpE184D47riAXlR2oqkB7hIcjnypAVXHmnO
	hPvOtEXkL+YpJoeaso2KkFDRYLsRq3oFZ9apb0GvPAYCnhPLQw+TDVK2195BKkJAfZ5YWpNuxYd
	njjEacB//kfL3FqG7oiLVS5mjh2h8Xgwy/xIF+qR9JNRObbHyt9wZeEtEzR4XwogfCSVD3EhJmL
	fqjiOcCY1zrW/02XsXOSVPPJlHzqgtX9ee+lBDYyMjIDaG2eqdZK/y+PyatOS8vlV5AmjwmuMAs
	jC+uRWJdI+bmZ8xI=
X-Received: by 2002:a05:620a:4611:b0:939:feee:630 with SMTP id af79cd13be357-939feee08eamr739525885a.30.1789227160510;
        Sat, 12 Sep 2026 08:32:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:939:feee:630 with SMTP id af79cd13be357-939feee08eamr739519285a.30.1789227159987;
        Sat, 12 Sep 2026 08:32:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm13061375f8f.4.2026.09.12.08.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:32:39 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:32:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: nord: Add the USB controller nodes
Message-ID: <uqusqjipcssrpmphugludj2yujz5jipcnjukubrgl6wdjqbrh3@yly6lsgymdf5>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911142040.100263-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNCBTYWx0ZWRfX4PSSRPuyaexR
 Te5duwqp7/kWB4JV1gbziuKMhX5EtdyrAjgQPQhF1wmuArGA+NfAgarSEsVrTOxkN8jlWB2m+Z4
 JMApgu3gMdjbVUzN56Ts3tpWrU74pq6pLIg+A0F4u6fspwW40iDbCWO/9Q3gh5hHtQIAeKMHakQ
 jxEKHqjuvohuxQphui+LduQTrt2b6apYgVfIqhyR9CIezwGbrLG7/DQ+XIlVU4JySFNngrtua95
 lIU4AQ3HQ1e8ymOEkyUV3QLM17nwizacS0KUuTfQqXHzoiuMFq79GwS7p7xvMMeCh3u24JsnvSW
 GgdN028ADVnTK7n3fPbBi31444U3jY1a7hoRSDFB4ZL4TwujQi2QNdDXOSATGXYRspL7SAykc1M
 kG4WSSyYCdX97fRcUWvsR0q5KYY5ZtmJOw9Fqn8DNzHQ15nmd0/DntwuN+/0DTdrk/dgoBZxB8K
 bAcUY4L1W0npbICFUJg==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa57099 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QHX0HLVNp1UGJ0cSOcMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNCBTYWx0ZWRfX95vsXSLHNwE8
 5U1X8S5RT2UCYmqt5Vm0mf7A8hKPIE2RMMioYFtDr94jvfxDgvlMlaS8/MTUiF003AlFRYBYUrC
 JDOT3Qyz8FMOU/FL2ql7qMY2qfcA66I=
X-Proofpoint-GUID: XyngbuD-L45eH619a16zsD9F5mujKegA
X-Proofpoint-ORIG-GUID: XyngbuD-L45eH619a16zsD9F5mujKegA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120224

On 26-09-11 22:20:37, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the base nodes for the three DWC3 USB controllers. These carry only
> the SoC-invariant properties and are disabled by default. The extension
> for the embedded Nord variant and relevant board files will add the
> platform resources and enable them.
> 
> USB_2 has no SuperSpeed PHY and no 'ss_phy_irq' on this SoC, so it is
> capped to high-speed and told to use UTMI as its pipe clock.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
