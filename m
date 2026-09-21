Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3216B1F5834
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 02:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789956699; cv=none; b=pdRD846BuSadwY15/nx4TvWGM8ztocsODe3zJXzCtt/RHqtSYwL7sXb1Gwx69dpK9V8sB+AYlHCE5wViv/mgALjZW9wdYe37jdIhaNANNO6MZkYxEi/+9+lMSdnISUBF0+XtCZbkcgO3hKGRBx8NLUQA/8+CqV3edsfck+khEgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789956699; c=relaxed/simple;
	bh=P508dyZlNxnQF5WAm/uJjtwcwhNhiFXcwVZ8Co6jZ0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zlo/cUTySSgsv1ELH2WetVRGDkX7OYcJV2w5SAF1dWaiSsTWG2DhnlKoKWsP1J2A2PFi+q8SnK83sdqC9Y2hfLYAUMlsfCGhqaG8lmWg5JoNNgT3yms1V2UaqK2db/r2Rhovo3tVeRzhoh0mqQg1U/YeoY3iwxMKngTXzw0t88s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKdamC3e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSueK/x9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKdamC3e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JSueK/x9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L0ku7t3197413
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 02:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hM+afzleg+Y6BVDw/uZ5WTic
	usaH9+vbIS29jpUbVFk=; b=iKdamC3e7Z5Ok0rU/yE3Gcz9YN9ioYDwJDyJKH6O
	4RGb0vdbA3Mk+aOW6GCc4XZycHeFiUNMukU7VShE9hL2qS3DVFe4QnWY/CtfUGBw
	dcqdONTgZFgTDwW+4/U16KBAghmdZKY/mDzGc/CDM4xEf9NBQn0QtxKaSpt4Yc95
	fZ0rY/CglybYJjvjfKYFReZgFZHzwyxmjrr51S716Nt2OJ2WJ+X/Ton4R2qg9Zni
	FM+WLwzSOfXAeIiPkb7loYsy2AuUelCwi98B22y1jkl2og4tyeImthF1Pzgq9JKl
	hfdRJhrCrrSKGKafK+5kRMYDv6h4fdjovtWS36TUFEMO4g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs847uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 02:11:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so3503202a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 19:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789956696; x=1790561496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hM+afzleg+Y6BVDw/uZ5WTicusaH9+vbIS29jpUbVFk=;
        b=JSueK/x9MENMcdH8IRjklBwFmjFQ8kBvnEUvfjCHPdXeXTCZr5u0MCtT0eyeKIErRc
         vejm5H2eUurXJEdFRzPaLgsFURyx5z8hbRaJKocFC2pF2//YIYLFpTwUCCxTcZCIuAWj
         ShaEBoThGsMYe+W3iFeGqPwaTMBdT4hnLxnsdL+/Ft5qYtFGzRCHfTD13hOYUittqQXE
         JO8EzyIJnhsEHMHfXZtZT+g5JqKQKux5gMymshQ3crIynP1l9LjU+uylzRYDIp47MMvs
         B3CpNdyJZv8lqLkwuTynz/EiSA930HcjBihAh/Qfsg6FOQQ+X7UmA7EGosiaJMuIyS6J
         52HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789956696; x=1790561496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hM+afzleg+Y6BVDw/uZ5WTicusaH9+vbIS29jpUbVFk=;
        b=eVZZM+d7LoxiM1jqP4kCcsmV3rlSiipl3/mP3zvsBx9PmP7JcUfMNQj10DXcZd/4ht
         oxnQRXSMIVsH2yRpqxWhx83t+vbslWxla68AA4DkF164D/wYf0h/1umsgeceYKKuJUFz
         4kBgX+DaBs4PhbYtHd7OjCPx8Ju6puNxdgS8ieZofQmzcnFnp8jv5g95AT2YPC8kGteI
         n1fSSl8vU2lZNjH03vP7otIautFVrpQABbz+InzW2fSQTR0wh6SQWTBw37AJLFm82Hdl
         Q/z7q1SF0KHlicP84ymPpJL2Rr52xrfPJZj5O8+N88PZT/S5Uo5uua0sJNXLrUaF7+tV
         DGAQ==
X-Forwarded-Encrypted: i=1; AKwUvByyo/s6GHTl1KhA0JQwhz3D5myaXbxnjmvrdBSWmS1NcgsqeSJ/AsLzSYwKgXiJB+tAH3YMZkYsJq6W2ud4@vger.kernel.org
X-Gm-Message-State: AFuF++k0ABmc0j1OzG3YkG8EKQtno1n7F4LsZOz3T1jEvyNHl+/ZBgof
	h/djR7v6hozweextlghDNAaEBkS3dtAHABE64ixUsAjLYrdytmHF82Jk/j3/zvaUxcJ25pxiaV9
	nDRTtB4K7exdR1m2M/wsBKqRH9gbPL0aS3OlAjaqdDfDELcjn4/lJ6SGljht3JE7tf/Xk
X-Gm-Gg: AYBFou07V9ljpYJ9wcN/28MaRkCyqH3TMGayZTSpZONOc9sT7u1JzsaAPNfDCe3nqLF
	7oqyoq0lsnaeR92lPZ8EcZkQSNauAMcQhvqHAmfuuuLKNT7Ci0K6ggc4QOEBSi393YYMOFIwJ35
	aN+RSJB4XxN4K0ATX8ObAKdK1GRzDOZRV6PPPclSU5fPObThMZnjjKFWXsPFo7AuDmZlAKHeqwO
	WwWHGtOoSM2DXHjQFS+bo/I+Gtw8QW/wZWFvw6b7KXjwuordV0uwhQSgUuVhebnxkNsJIMZ4JUb
	287m4vsGwvvHC65K8JdOVEj/6kcX6fBbjaSo7sCCVHtLnZP9WkPfIOnNEq8bK0OvTA+KHlUSjuY
	ZXbms3U0xWPsgHjTqVyoiHPfdUtlh0chpzaoblpqwBz8=
X-Received: by 2002:a05:6a20:918f:b0:3dd:a197:cf25 with SMTP id adf61e73a8af0-3dda197d826mr8301461637.73.1789956696110;
        Sun, 20 Sep 2026 19:11:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:918f:b0:3dd:a197:cf25 with SMTP id adf61e73a8af0-3dda197d826mr8301432637.73.1789956695660;
        Sun, 20 Sep 2026 19:11:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144e16a7f71sm5565055c88.8.2026.09.20.19.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:11:35 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:11:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Message-ID: <arCSUfdtKPB4eedm@QCOM-aGQu4IUr3Y>
References: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
 <aqtX1Dvi2uyCEdMx@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqtX1Dvi2uyCEdMx@QCOM-aGQu4IUr3Y>
X-Proofpoint-ORIG-GUID: LJ0hPOelS_syLobg1qh-6DZ0G76lXO8q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDAyOCBTYWx0ZWRfX7oquavNSVucO
 5lqteh8sTpHgtWY6PPRiAPTTYcwOkStllYOQ4ASY6wVABl2SRNhC2VVdu42ptDPm8FVKDumMu8p
 m4CNNOi9Q//4AIvDKpjEZeK4FJ7w/VE=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6ab09259 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=j--DFvPhMHtmlsMSmk8A:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDAyOCBTYWx0ZWRfX+g526olUUPmP
 XodoMaV6XJyYepvgtK5i8Q/uHsNaNMMKsbPiMBxa0uUHhKk7Cd1MlhW200OtjPNS/F88xWwzLfT
 K3i+V4NoD2d1TlUb20J7pR0ckvx3bePrzRXZhXEJ15MeLh/xlKJbLSXscC+M3+jaxUPzfIKlqbs
 Rc82Cz9pwq1imEjYUMXkoOdVkVmPd3FeVdqgEyhBfZekw4mfbbsFwEH8Xsy2hTRU410Wmiy7UfC
 DWxiWo9uU47mJAMZedEv/LtVfEFO/UzTAUSFLoRuypYmITCjk2go8sw5LQ4lkUiCGq8eqtKkiMu
 z80d9NVg0SSykdPdlcL1b/cUQPkORa9Yh56AGzTjDyTnOJgWoaXV4WjtGutsHlLb3JFuRqg+Ehi
 Cjh3aO0B2NvV5fDKZ8+jSeT3hSjqyipHUhPUwl7P2XNxkl7z57u7mrHihGGoVKAFQxGwqtbYmXE
 /d/dp0I6aOWFn3opcHg==
X-Proofpoint-GUID: LJ0hPOelS_syLobg1qh-6DZ0G76lXO8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210028

On Thu, Sep 17, 2026 at 11:00:36AM +0800, Shawn Guo wrote:
> On Wed, Sep 16, 2026 at 05:55:37PM +0200, Bartosz Golaszewski wrote:
> > Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
> > nodes.
> 
> As the nord base dts series hasn't been applied, we need to call out the
> dependency in the cover letter.

This comment is not valid any more, as Bjorn just applied the Nord base
DTS series.

But I just found that CHECK_DTBS of qcom/nord-rrd.dtb is not clean.

arch/arm64/boot/dts/qcom/nord-rrd.dtb: dma-controller@800000 (qcom,nord-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
        ['qcom,nord-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long

Shawn
