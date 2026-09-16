Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F644495537
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549331; cv=none; b=WvrahpvYaxeRySCf2V1LhsWg0DAiKiQ0s+jxm8F8TrVQwKmpKfNj+vnh6ffCjk7YSlKZntY3Xd2p3+hpUkYBs7521usFGFxFriy04TGRiRCHYp6qxZWMx+wDGEbQbR21kbBtpyKtzzyWDoP52HxiKkZGablUqovWKUOk68cDqjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549331; c=relaxed/simple;
	bh=r9Q8CXvGxe0d1gFFAq8dmgIyqj34U9uBRqhGzo7Tk38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZNA6b+S2ztflDZgjw+QFev1xyoKl4KyoWIPl7w2UNeJRCL6EWJTtVYx9pC21163C++vzwBZoPKqyFuLRaAPwrgJpvMPX865JWwDD9wD4xHA/nsGyWZyLKpUSi5NiY7cANp7XdlhsYiNHktSFQc4rI2UFbS3AiAHvxg2PjgUc6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2ezgGsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwAcTCbX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2ezgGsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DwAcTCbX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G7XaVP2970550
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzt0WFn+hreY1nek99/9HyLvSQmxWneI+I0Nq2EeaWg=; b=O2ezgGsWYxJS6Y+K
	A+2pH5fxgPofFY70ilnqTCBYJrx/0TE3+ybKzgV85qRKN0ycYgCuM5GFCDcux82E
	6ZJ6grPzj3iC4oqsBBg/AiE7QusQjb84yMZijpRuuS6D+oXMltMdx96JF1tu5Pdi
	SxNyEWAwaqCvXDdZNiEcsd4qY/N+VgP52cCiAJ6OFXlwfBWqgNhwTsNOXHZEZ6Sp
	KqNeTv45Pe1fI4drfUHsPv2HE6X5KtUOUQb5h9Izk64C0kJb4uPZJl8eP4VfJ+rg
	1HVFbNnXrKOsd+1GQPittF+4euE7VPMTu5lC6gfqLe+/4o3iK7dDqrW47HF6ksAb
	cEucRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2rats-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:01:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939062ecda9so842782785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 02:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549305; x=1790154105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tzt0WFn+hreY1nek99/9HyLvSQmxWneI+I0Nq2EeaWg=;
        b=DwAcTCbXk8hCf+uCc5iOeR4lXiJ1eD9xm3XWw2qEN4W/ksEi5P/Hze6ZIrGuti+Red
         CgV74xxcdNBq797nrDfD5/arPQMd6KiwRoKNlLHqVO3bThp5epevfCQqIE/uD6ZH0cTO
         JB5ktHZyTryLX+ZH8OmfOqYGJkHo6rNSyldzo0515g40PvHcQp5QNEkfN06lrXr6AKPO
         +c33HJtgWhzDfqP7Ore/Yc4MduaxLSa3PT8J/YnngUrpd+56hPDfmUVRo97eQ8Lbik1I
         QZbdwO3YntepWDZ2ewmr2Bvec2GXFrhzshyVNLF8EO+W5ixRVdC5CQpuQApvsPmQUQQh
         GajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549305; x=1790154105;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzt0WFn+hreY1nek99/9HyLvSQmxWneI+I0Nq2EeaWg=;
        b=QmtD3KIihcS91ir0XK+78GY8qlW/Ohe14QsZ7A+DIPZ7+yVqqrWKsH2a2a/Ue83IPL
         21veAxg3pl2pBKtKoQhhoQBviyW+M+TkFXOYM6DekztF0dV/iGI2Kc67xryW3FeRDXPa
         huif3+M2A46crBkWWljeCAMhx42xAXfzkjaiNdYYUL2iY5TmkZFcD7tbVSBf6ouKvUkh
         NlAblQjEdItdQPgtQQR9Pnct6Pq6wxm8PRhLChioxeCVxyo9nP0NCOQzaXtLCfnghUuz
         pQ7Br4nnUZ5Fi775NHMDNrU0nmL66T5ZHQSucP4KI9GMjacoZo97WUB3XW3WmiZne+FY
         FUxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUTVvpwxjKqQ0F9xBFaFkSBwQMauMCdpEDN7rMa0orYXp5GFV1RM3wFOz2nO18jGfP8ooV80SfxD74uPRs@vger.kernel.org
X-Gm-Message-State: AFuF++l86N1g1Lvs0YTp7umSEDQQkLgmLex8vomyvugYMvPyMamxOuPx
	XhDln+yxtv15bPrxw6oQslb4xJg3za60hgFn6PscjprGnQ8xUrE5aGxgF+m5WY+ugmHsCsUCnFW
	E0o1VOpdOzmR3oY2XlWID/ijjJn3b+jHv4iWjWA80oMX+iJBRy58DJJAx5HNbKVkwNe3b
X-Gm-Gg: AYBFou000f4HnNvSSsrNhE2MzLjeSH/nH1rbbn31DwIJ2Jv4A+Slp1uZg4w2n5WtZhl
	F/7dA/Gqbk3/OtoR2OoXBA/UQm1MVqncag5q38qvRjDef/sv5uH90Igf7WkdxZcVKFpPRBmQ6Ed
	sX6dA/2mbdfDOEY2FDKS9X1zAw82BYr0lkhH89U5fAFZIVk761Xe5TDU+5l6t4i2ve9ndwO+Aw6
	vR0UMNLHO2wPTEAq1MR7DVlejdpXYtxFe3+XhtSmbKFyGfVCNHhWF5pQJm6c81dwWf9jXSa6lU9
	G1S6DsgyXyAWKFFREaAMz/qpOigIfhO6231RWQ2TTigI2L9FoTqdhh/VKHsu15cLLb+Be7ilE6G
	UHtbr3aa1S/TNXPGB7tTvCk767FE=
X-Received: by 2002:a05:620a:288b:b0:939:6de6:5487 with SMTP id af79cd13be357-93bb794cca1mr249161685a.44.1789549305047;
        Wed, 16 Sep 2026 02:01:45 -0700 (PDT)
X-Received: by 2002:a05:620a:288b:b0:939:6de6:5487 with SMTP id af79cd13be357-93bb794cca1mr249153885a.44.1789549304517;
        Wed, 16 Sep 2026 02:01:44 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7678sm6473464f8f.2.2026.09.16.02.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:01:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: Include value in debugfs output
Date: Wed, 16 Sep 2026 11:01:40 +0200
Message-ID: <178954925614.6008.15490710195931026839.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915-pinctrl-lpass-debug-v1-1-bc49766c9f6f@oss.qualcomm.com>
References: <20260915-pinctrl-lpass-debug-v1-1-bc49766c9f6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TZvbjJ55v85BUmxnSLaSgMeG4IhRQKF8
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa5afa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xM0vMNglaa6g24SigUgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TZvbjJ55v85BUmxnSLaSgMeG4IhRQKF8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX+VbXj6A/71rt
 M7CjvXBflLhmSMYEhy1Vmy5S13lZsgR+yiV1rt/fujp3eBsMy+fLdIPVjSMP+vQZj7M3LNXZRFF
 fHltgXZO1I27nfu27Evq/OdCOVZI5x12mh14dSWmn+BDh0JppQN97JkldUsUW8AaexdunsT0at7
 NQWUNhZ3ynNpGeZcpkK0nyGxiyn1+NgFww7TMpHZplPNITItn2b6HtWn5aEDfIjI5kzgqHMX7w1
 +v7f2EU81CNUzTURYC3C87SvCo8eyTfN4lbk0jJWbWT54YuS948ffMfLc5AWc811FdS7SztrGLb
 GFMMUgjXFpRcyS98OkeTKp89VYmOfFsTc3GtxceiWWPz6jTHJgFlx5nSzwLTJEKY6/WjRof/8Yk
 5KPssRAzOnetguPGyuWW3ZW8ztB+3j6jNufQ6/VKsRDXkGHv6xZrbUulJ3j3msjS+pkIpM3k04O
 aWpxKYDgfRivxk9rA6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX99CKCJrtMSh2
 hYq4B22Kq93yT5PyZVCQY/w5bdqk8f3gqO+w44bVglydOoM4bXZXDU8yix4KAVXuM7hZT+NOekK
 nWl1BHU4OURFLim7XcpL0ML+Q4/b2P8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160116


On Tue, 15 Sep 2026 19:00:15 -0500, Bjorn Andersson wrote:
> As with other pinctrl providers, it's useful to be able to inspect the
> current GPIO state of the LPASS LPI pins during system integration and
> debugging.
> 
> Extend the driver's debugfs logic to read the current value and include
> this in the printout.
> 
> [...]

Sashiko's probably right about the return value check but it's debugfs so I
won't worry too much.

[1/1] pinctrl: qcom: lpass-lpi: Include value in debugfs output
      https://git.kernel.org/brgl/c/d29bfb93a19771b822dab6d7adbbbaf188cb1db5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
