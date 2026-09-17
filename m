Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961384B403A
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638283; cv=none; b=Zt/rYnbBEwzviMcd6B/vT2pB7usFP31XMfmXtlzBclHmQAHmpvwyoqzog/AUHbEjxi4YT0ubiQWIOvNjrZcQppx/TTk0JL26OAnIuCRLZVm6L5BnsxvevNreA4fb7GoeFzfY/sGQ3rFq6XD5He+p0MrzLlfjduEhHXCK140Ai0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638283; c=relaxed/simple;
	bh=W3avD/gwwEkeiicWHrArtYtKTr1r5cPUIp2WpU4qAoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VmudZQnhFuz+UhwwlMemhfKsvuy2rFXUDS2/ppwzMjpPYaffbKOArqJYfT2kPp28kHIyqbOjEdrrpXB7CixWIXpa9ENgs6ZtWLDgC+oPykFqm9wUPDubTkymaA1FG41Ngqmyg/ceNYn6r1nW5EQLv7okeYgWPWYq7u+RfPJryGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3vQ+B+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLxinP5T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3vQ+B+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLxinP5T"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZR892410417
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ka3m7yPQ6zXpaZ43TO2KozhhqfAFnwYtxFW
	YYUMBqKs=; b=Y3vQ+B+Z1ecneAXa0LqLRWyTCBNGfHkcOi0J5ItWYzGcKZ/26VQ
	8PdtJfAts7FffvIKXWog/HBqpgKqMP+QJEE7xrzB75uErdlUFaJbU0eGifhGFXV3
	dzul8nXZLPHTiWTErSwr4UGwv9c6romnIKMqtwOuyHXLIaLgcw7Y4OTMLFvwjzcj
	xFJDYGslHOljhLMSag1FNde8MOSue43UPini1C8WrlYYi0/LrtB+WC/hqG7InHhi
	tlJzXH/8Fwr/IlMEzAD2K7j930N2CliHJtV1hxEST/nvfwzlMZjyc0FOuR7Eg3Ae
	+7fDfEfAtDKLGWBsxrP6IOOUfK7zSpQ3ZIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6g3s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:44:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a01d1d1b6so84728185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638243; x=1790243043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ka3m7yPQ6zXpaZ43TO2KozhhqfAFnwYtxFWYYUMBqKs=;
        b=FLxinP5TUfLQilmCCEyeoll1PGc3srvzJVNfu46lj6o3TqdMWyn7sW7XrS/fTp+LYG
         25COkbKBplJ4PrMzuy05Nc0Mr7MuOz4Pc2KcnzCNoYkEUkbymna0949D9sOyR3xA+PTb
         JF1iNmIvK/VJBo6hLAN4JBLo+hj6B1O34+YrMrdhtSeqjBppLGGWGQ3PNZvWPv5+R/Ag
         ZuQA8E9DvtTllkkK88U84O1M3Tvh834dzfMUJlgW1zwOx64TwSxZIErn7xO2rwUup1ci
         91x17tvHvIbbcy8WN6Bd8qbSOMk3KCUIZWbBSDPEZkvEhEAlUpcW2ysebbVaUaYQ24SR
         BNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638243; x=1790243043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ka3m7yPQ6zXpaZ43TO2KozhhqfAFnwYtxFWYYUMBqKs=;
        b=Uhbbyarh7OTMRAyX8Ao1XFYK0cwIgwn3rM9ZE/jtJ3p6BCOuGxaObLO322Lko+hkKb
         mw7Z4nCCDv9u1nBPLnFdldAgAEZVwkAwGpZUA2D4+FdkfVLLeyjI97jDGF8D7btkvjTJ
         IzNg5RTizI0fP9otBZ8JctWMSwRcRGK4d184BH2cBoUcxj/iHdEOY4pD+FyJnR1VSX4Q
         pmsn/hnY1BXTpr4C6l9sMuP7Q88apQ8zGjRQKfZmnO0LHL/X209j7VHCJ8kQSk4LkeLS
         N6fzX3CS3mKtIlUL18uFNcnWrkaiQliiQRmaVAB7hzzFmTjS6VJ1ahmT2BTI/w35h0/v
         YlqQ==
X-Gm-Message-State: AFuF++nu9CpltGT+6rLqqgRmAIEQbnKgI6UqfYXYEk2Qe8bTSmstZpYk
	dSZnHZN03x8E58lA4D98sTfHiOnSucJdJd5B29SwMUHp1X89vffC3nyJAA/O7xF+cMSbPTcO9N1
	MD9Ith6O+2yxjYShoGkr5INr51qxTBxvK8yigSGjEA/xHBkzSJAYjJTk8/Qa/BWfEPY/C
X-Gm-Gg: AYBFou0QS0E5m8AQLZWEM5b3baZvwZsmxQbheaaHAHDVWRI96RvsNFjdSNbGgmSKJqd
	R64PmaguV2ReDNnlLE/h4xORNJJL85UWWiuJ9wDmIRwXvrNS2S2gDk0t45F8p1AvterGFP1h6zA
	ZNQhxU/sG1UcA6vg6teI61p+ltyKJrSfDUvJMPP0mExnfOYvx47mlb68g0CltZgCklfNbXp83pd
	s5v1nfKqNzfEsh9LCEJtGxNfumJqM+yUBh9wm9KQ6svJomqoQ9HE0biaGbnT45uIyAb1qYvOzak
	rTY1yzg2oXcZVkU+O2+PxvRZv44b9q+wmCvJPBe9BgV2IwH0TpXGjanTE5vpjam8P6PvHnvsscm
	66aPQ5P2xkIotDCPaYlNaA+ubFxg=
X-Received: by 2002:a05:620a:470c:b0:93a:3c8a:2025 with SMTP id af79cd13be357-93bb7880659mr1030778585a.34.1789638242979;
        Thu, 17 Sep 2026 02:44:02 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:93a:3c8a:2025 with SMTP id af79cd13be357-93bb7880659mr1030775885a.34.1789638242561;
        Thu, 17 Sep 2026 02:44:02 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbda7c462sm515895e9.4.2026.09.17.02.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:44:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pin control fixes for v7.3-rc4
Date: Thu, 17 Sep 2026 11:43:56 +0200
Message-ID: <20260917094356.7040-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9c9sW6YKk1RQgZeOOV7EsywO5BzEEYTR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNCBTYWx0ZWRfX6xyPIc2XNCII
 tnea3EMaCg+5MCphoMYrxvB8s3eihyNzDWlvYlUU9Cjy5Xy1z6ACe95X7ag/++iL//qKouBLSbH
 DRwOCjXfSVLaPBYCZWVfRkdUBJ+2LuE+WKmTbjW28FMzSRIfVK1LNhXbD2ma7CJKMucWPPd5h/f
 bU4nOm5t4I7m4hsFZQTjysD9aUI8j+Nii0tl8k2PzeKiXjOnDN7LlfbMgQm8Ae+QAvTMnIn8Gwf
 yjFnhUvDNLQQSo0Qa1WGhhp0GsDcSjMKIclcoMc97BVy3OAmNCeeSZicLLftXwy2jqRKksRUQ9t
 NB90EC2m0kLVCage9SfVTGZiCVJmLWWWBkucQsea6TIReF0VwY55v2rXipTpItE3694NfPbrps2
 +EJuQGVnnlaVXgQZseO6F0tyXYsNpO7b8gbHh5y0/bint+QbZwXX/m/JuU2LTfjeK218AeKcsF/
 h2OSd622NFd9GpoxlKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNCBTYWx0ZWRfX9G8tQ1vnXwth
 PcqUtHswegY19GUn5Prab7nwohzOWrMihpPui09c9hWFiDF1bcuZYfGzuU96zgSRhHd4+AKgIIT
 lphoiXHdcWBYnD+tClu6lxdEA2YCW78=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabb664 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=P8F4T-NFUzOHK0OehmwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 9c9sW6YKk1RQgZeOOV7EsywO5BzEEYTR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170134

Linus,

Please pull the following set of Qualcomm pin controller fixes for the
next RC.

Thanks,
Bartosz

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-fixes-for-v7.3-rc4

for you to fetch changes up to 818103dc7f5998a0d7957fb71d4deecdf4d579e1:

  pinctrl: qcom: ipq5210: Publish the OF module alias (2026-09-07 10:51:54 +0200)

----------------------------------------------------------------
Qualcomm pin control fixes for v7.3-rc4

- fix QUP1 functions in pinctrl-nord
- add missing MODULE_DEVICE_TABLE() for pinctrl-ipq5210

----------------------------------------------------------------
Shawn Guo (1):
      pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions

hpp.iscas (1):
      pinctrl: qcom: ipq5210: Publish the OF module alias

 .../bindings/pinctrl/qcom,nord-tlmm.yaml           |  7 +++--
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             |  1 +
 drivers/pinctrl/qcom/pinctrl-nord.c                | 34 +++++++++++++++-------
 3 files changed, 28 insertions(+), 14 deletions(-)
