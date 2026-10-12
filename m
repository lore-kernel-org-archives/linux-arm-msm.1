Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5C548CD78
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814534; cv=none; b=XmWKgYYThuVrR9JoCfU/J/86QL7qzInY+hKm0OVsQRykRAhcAiBsyPhWsd6lZTK++2llpFR0rUSqWi9wYlbe3Xtq+IvQTrPqueHSD48GX0ybyno3L0yGZ+uK7d9E/MSy2xjsp6u7iF+I9KsPUWFKd7bQzi+xFSluoiwhl6YCQaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814534; c=relaxed/simple;
	bh=1kaXsKB1fh5+qDLa1LDlgXg2iHpGQnV77ZWJonixFSw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VIPitpMRMkjrMjEZR1On2g1aVxpttQgZgeELYHFdQl+vrIhCAEmypPXkRDWrs6+7uqRIAn0LXU2aG2jnJZ2PyrqSMfhhqWr6DP1c1p72YD9VS43i2Gdp0i5LSyQq9GW6gyAZLbeDfdUgyNgWxBAeca9TYSjXba3rhmEhp3rO5iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDjckY2L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CziieWLX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDjckY2L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CziieWLX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC07ZK1933167
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFX29kFGAtu2xPnsttu6rTskuC0EwNUJ8aX+55jfLAA=; b=ZDjckY2L8vr+JJ35
	7MvKR6g4V1kRet4H0ExeEU3lMbaADfgQkJn4efZjxU5P1d34Xf2f5HP966oBLJJq
	TOnlRpDYB1xHSd3vYQ4XFQHQjQLqp3tlId/yt3fxc+fDEX0uekxnBwrJJ4HRmxIe
	wnmlIuZjXjG9q/wLzrDlAbvDPzyvBEqRP+YjyoNx8RDvbLWyajPVZmIF6vTyhAXb
	m+GNOtA/8BGzzsF58e2Nzd7XrV+YjApKVOaKNh/0oKzWdBub+5fEoXHk1IirNRQB
	8YAo9eSceaofn3iuGUUgq0Dlb4XqghzFDsFaFn7n9tjO6Ndgwum4SyVdr+I6Va8C
	7A7+qA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkjjqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:15:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4917030eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791814530; x=1792419330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFX29kFGAtu2xPnsttu6rTskuC0EwNUJ8aX+55jfLAA=;
        b=CziieWLX1wIHvrvHB8msQCw7yJZUM6lpqKJUgd6iYyoJ8eGL+eAzEr6AKm9Yf2Re0s
         drZ707Nm/oWyso8lSzMZs+ekUP1XBoWBQsggmIHByoaQl3k0/MmMXrjEUJKsMKBLQSBp
         Ayvkfnz0QU5z9BEWj7id3Xq0Z15WCOtSHeoaYDqM2dtF3PA6fd42lKBpxjjj1h1/r3hS
         mA6tWsGObWKadLWefCHEClPUTOCK+gachbgl1c1ivcaCzjoYkXMj+JsSnoH+m+VzG+1R
         SMjcUowVx3r4B0rCYZrIJpb48JpYgvhfUvL3pxw/z8IPcSDfXW6VzMjyftcdEsKdxKMK
         AH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814530; x=1792419330;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFX29kFGAtu2xPnsttu6rTskuC0EwNUJ8aX+55jfLAA=;
        b=2FE1woUjhK2SVs7+wnwfUr6OmY6W8+2+3/FN+MivkOksopLMhw0hJ/zS5+oBtlDe5H
         0OpfgDk5VNpoQfr8dm6xbFbqJ+5pK++dKTmfo+uxIChR6eYZl7Y4q2p6pCGM08IrPO1h
         Lhd6qiW/PMt5Mn3B3pHcJf9FB3cBg5xpYRJciHH9K5mb+rmjCCgKkPfEeemtiks7QlWT
         aArOQv0BC/dwu1IzZCJRyKkwynvD7Gkd0HNUFXEVfEHpdgbAL0WfjgH/DHp0cdKeDzm4
         WLyTCPw+LQXynAgqb/rsbZMWHZca3cuYKu5Al/+W77VDQO9wOykIBvqHyclFyE87PtGO
         BjVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsQ3XHC48rLWyFZ/Vunr6r/qrkdg2KeD7R72V5zi9eF2tioNUKLQXUYqH/oE1gBYHMy/QRFjORxDAyH4l/@vger.kernel.org
X-Gm-Message-State: AFq9FYKkNluGloT09M6jMzxtfdLfLUOy1az3qoR55A7gxN8omNkRdYgw
	xcljTv1I4exVP3Q6LVemu5ELKdFzvzSzmCjv9tCKKBpwooKtx6vwND2qyABKPu4J/oLMJ+u8V1h
	5j46dDcahrb60EprQGc0IljbfG38n/n6S9qxM61d776aLVTp45rxzBnSac5s9Ra7VVd17
X-Gm-Gg: AYBFou2dMSItV7e3Whgvz1bXFnsxAweyJMbaB9h1aD1hqHByv6omF52QNm/BUZCmb1B
	KkprYZ3pWbDFrvI3nXu/MUM0GXQJ22R/HQN7OSKmM3YvcLEepl+BayVMDpyWIFotBXfuBWvISlF
	iH+kGlAQGgDcWDBv60l5l9D8+7i+rv02GudzKnfpCWKYSHttkgqdLkbd029sN1gZ+UpYmC4SKMy
	SubFBQKZ82AHMmJY6UZvaUdNd9tsKc43YJK80H8GhzeWx7uDe8XRKuMY78/J9frtXkKQr3kV3Mb
	bzTeMjw1DOhsIRQ6+kwOmq3RzetdW07w3q9tpBwaR6DD3rcTfe75I2p8xh73UrZP0UK7FmAGwo1
	LCFl2OknVQwvbp5m0AqfIpzykU7kB6lGjfJLCX+nuu7qezEwFZJHn2Hu6Xa80M5XC
X-Received: by 2002:a05:693c:4196:20b0:35b:af:a075 with SMTP id 5a478bee46e88-35b00afb749mr3312633eec.22.1791814530330;
        Mon, 12 Oct 2026 07:15:30 -0700 (PDT)
X-Received: by 2002:a05:693c:4196:20b0:35b:af:a075 with SMTP id 5a478bee46e88-35b00afb749mr3312594eec.22.1791814529564;
        Mon, 12 Oct 2026 07:15:29 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (las-colo1-bdr-fw-bdr.qualcomm.com. [129.46.96.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm21302992eec.31.2026.10.12.07.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:15:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Dale Whinham <daleyo@gmail.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261006062728.45007-1-franzelfranzel@gmail.com>
References: <20261006062728.45007-1-franzelfranzel@gmail.com>
Subject: Re: [PATCH v2] wifi: ath12k: skip hardware rfkill setup on
 Microsoft Surface devices
Message-Id: <179181452875.1215069.2287645106143483581.b4-ty@b4>
Date: Mon, 12 Oct 2026 07:15:28 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfX4QMg9R/hZ6CO
 2+lB4+NPOGFYggSlE6j4lYapZXIWN3Xw3NHUIElCgvHLsGLTgB9ic8CwRYcN0JDbh89w2dFDn6O
 DzEPAUF925cNV6xqxxA4SMEGYooQBoDE7w4cCheE70C3Uhuk4P5/dyG6nS4dRsDROoEvaOSLrWi
 OqWCFAR45z7tbq7orIV4/ZnMz+EPMCmS0fGKOjjkZj7aer/owuXAySIUIuT0ZCxqkFg74gDtbo9
 JCi0EuPtQnYgpXDI8abG0Yaux14jyjhokaqH432cOyJXLZPjRWtBwXjCf15WBBFhunPUncd60CY
 hGQvyYsWsxiZz1WgmpnSu8426ahnjK0bC8wv3B1zIavXPXPE3MGpefg9yQlCUX9DpO1QD9jOequ
 tsBDfucay/w9zoWfP6xNVaizp4ZPfJIpoX8/xpdLGcBwURDlD6HRexog7+av2AYh2NARP6w6w6j
 6Ledhe305dNLUPvhOOw==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acceb83 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=zwy/ZOtzXhWWzLhDjT6TXA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5GOfUL4nasl92P49FscA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfX8ryzgaZODJwg
 sShFs3GClecJFnqoAvc0rbKZ3e1rgvBhLIDVXeZSqwbzGirktsAKIeiIt2qQiylBr+cXo3VAgU9
 bsamv2BePbYpkdQY7QZAnoWdcZxDxkc=
X-Proofpoint-ORIG-GUID: VtBZcDt0Z_pO1iskQY1o-ayYvWwKPkGg
X-Proofpoint-GUID: VtBZcDt0Z_pO1iskQY1o-ayYvWwKPkGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120056


On Tue, 06 Oct 2026 08:27:28 +0200, François Roux wrote:
> On the Microsoft Surface Pro 11 and Surface Laptop 7 (X1E80100), the
> WCN7850 hardware rfkill input reads as "radio off" and the OS has no
> way to control it. ath12k enables hardware rfkill handling, so Wi-Fi
> stays hard-blocked:
> 
>   iwd: Error bringing interface 4 up: Operation not possible due to RF-kill
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: skip hardware rfkill setup on Microsoft Surface devices
      commit: 5949d1910f13c20f6ebcd26eec9e0c02cb4951aa

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

