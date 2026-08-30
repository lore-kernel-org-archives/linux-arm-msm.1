Received: from mail-oi2-f5.google.com (mail-oi2-f5.google.com [74.125.231.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45098261B8A
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 02:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.197
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788055304; cv=pass; b=tNsNVvx+i7lXggpqDB0cmKeekWU8YUkS5RVgrY2ntiOjs03xx8k3XJcib2p9SNTBQ2U7zYydK4uw3W9HKaS4/O8tbrQ1jDr5MQh/EYLeWyzemkr6XQaexM1Ljz3XaoIH3/dpaSFcIpRKUWTADv2r8Qv045LEuq7hS3+Rgjk1g8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788055304; c=relaxed/simple;
	bh=6XOymjcSjWubZwLEdxGedBY3LnWQ+Ks9qj5cDmVh2UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rl5rGLIa4IH2ajopoMOnEdoESTD/jx9P6m4PFn77Gsa2ZfzSAOx/HJ4XPgQ1bHxXcaFN7fcVpQrBEvy+GwKKCEtvMRaTATKXIEzm1a9m/mQfrGqjgDr2LNfHdt2FT3nU5HGPcEIA1v+ruEU28Waa1vlDvNzRadjxgwHh/czhf+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFcAhEXs; arc=pass smtp.client-ip=74.125.231.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFcAhEXs"
Received: by mail-oi2-f5.google.com with SMTP id 46e09a7af769-7f4e10aa28cso429050a34.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 19:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788055302; cv=none;
        d=google.com; s=arc-20260327;
        b=EOr+4drz751Fh/7skqUIeMooZS+ViYzYtuY0h5K7SLlZDvRtaHcNg4p2jyDK5NWsXl
         m2ExQUOHEr3UowYV+kvoSpBfeCMHck5TVscwblOHrJtmUrWFIBeKuxZ8bOtaNp52dvV6
         DULX+NJsIyy/pI4yAe8vjLtNmV+UBHtG2MBt1cSYdQ6YSf7t1GNN3jbYYxgvKozfkm1O
         g51LOs0PdnGXm7qRBUDx5rL88fzzuSa9U4pLK6LD8xhlYlRAC8PbGxs6H29z/iaqAFTS
         XZTs1nPtvNcup7hJ5UG7//MO1krAYqJQq+Ln9miR9ckEUsmOv81HS2VtxNC72+YA1zlh
         P08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6XOymjcSjWubZwLEdxGedBY3LnWQ+Ks9qj5cDmVh2UU=;
        fh=Io8ovwmulSVbEXBrqpGV4ciAwhP2hxkqjJtSpKyjpbk=;
        b=ETGpR30dbaK0nH/icjAM5DJ9DnISXsDg+osrO/LlIORYZ3i8M9R6OeESXNsSpYlRcb
         V7O6OXLQi7cQjj9En6HjTPPjRQCaNEFn8CwE0lsOc3Rq+U63w9lpAI6fU9PKEZnTZKod
         nBXUYA1z9648RKp3VZTpqYGpUp8Pcvol5nmIMKsJGdYaKyn2c47NQrb4r5+Iaqy3fiX5
         VGGhZAE3a4ZP0g8jxcPeWd78SY8cJ6S+TLcmbDCJet1nHm3rtHDSg7Xu5z2lKl2lieNH
         NAFj5WtbBUtkS94fLMAWzWsUasitqKc67RDXXJYI4XCxuOYh1FCwKOXqIxW9A2VDGgxP
         pimA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788055302; x=1788660102; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6XOymjcSjWubZwLEdxGedBY3LnWQ+Ks9qj5cDmVh2UU=;
        b=XFcAhEXs24uI+CzAKLVDlyhSGSoVGmqtIdfIKd4sXqcxCkUCv9yRRnJO3dPqEZjjNi
         XzyW5jNMhWHsaJZmoFYP5+ZqukZjcdO0fj/eEgu4wX1m1/RncJWwDPwLGpbeVvo90wtO
         Az4td3zc2S0JjL1eWqZel6DVfsp//EVsWkILP4U5XE8lMtVSREifyrj2pTkTJGqA5srY
         WDSfrpt4UDyBkWbvefXWE40Zc53zcZsm4iayh7GYqvDZQdO/qUAYbwOg6OiPQ1vTzBQq
         0p4Qtvac4dWe0jRAU1ebj0a6SnHuIeu+MopPMwt1qKN1Jl/GAJNym1Uk9bdDM4rC6q35
         Kwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788055302; x=1788660102;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6XOymjcSjWubZwLEdxGedBY3LnWQ+Ks9qj5cDmVh2UU=;
        b=FMZGt6ZbYpVfKmcq3jRGkzrr08rs56BAV8pd+L4vTaZL3JctZjbi0KviJrR3VTu2l2
         +mMdZp5EpsljSVIPAu3+MapTFmjCwclvQsr08Mgp1jCtWGvW5M2mD6sS9sSDlQMFnlc5
         TgmPsxfRYKlQY0WnfrNQud8eUKQqtmVfsQogAKc3w2tCrYsiqANn2miWAGuojPH4kk0k
         IjxJ33Nj2z7Bz174tPhm9quUwXWugxTMwg+dACEyL2wicv8yZDTB8lc7Syjyx8ygMxsB
         axrnD+Ml61i9JLs2F6G0F5bVvAeLyoafxkAdi5xnuRmbuqqHmZg87RreM97wYLbztyBM
         Ddlg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6NytQ/0z54mUChJ7HtftNu84kEV8K20kI1qTpDy9qBwSVvrAvA4SZ5bQJpPPOId6Ov/i3chkLGVeBevlz@vger.kernel.org
X-Gm-Message-State: AFuF++lVDgC9pmKU42xDUE0U2h3gTq1lz+AtJ3iqJMLK9Pyz7qTeD44w
	UPGPPV6OkaKJPshesOW1KqWaEIqmQmQ/w2+PPIJMn+nBO+OrJ8ROn2HQxUVTz7s99xpUqsohTeb
	2BAgLYKAjPWY/ZVvoHLW47jeYsbKfv8o=
X-Gm-Gg: AR+sD11hEL1izhCXd2hqssWdd8bWDKNLchsNgTiR8hgBSV7L3vyFU3VwR52KfzKlODL
	8gidwrol9Y1myCBWPCS22Ag2vZDJkrRTqACypnPksjJlxUGqWb/Dk+dVEXD4i1iGUCh2PWxx8/J
	rUP/yXEkzJ7p4ztRlk1M9xQ1uxbGMb/BaWTBfxEcnMxN5wwwQb/hwGdXZ0z3wtSsfASuZhrhhfP
	tNBXYm2BHgKK2AlCgCoLPQpWUu84f59XK2oPLO5cmjND5VIHxE5jUiSM3Jb5viD4AvNUrmQONDj
	3OpoHPHh6pnOrthlP+JoS3SzJySviJMHhp+7ICLoD8pS06nsNu94anOjnIWWNXnitymFgYGBNK+
	erjc=
X-Received: by 2002:a05:6808:178e:b0:4b2:b653:87ff with SMTP id
 5614622812f47-4b39803b2ffmr20583581b6e.7.1788055301793; Sat, 29 Aug 2026
 19:01:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729011001.16999-1-dennylin0707@gmail.com> <22f01d3e-85ad-43ec-aa01-e5f3eced8703@oss.qualcomm.com>
In-Reply-To: <22f01d3e-85ad-43ec-aa01-e5f3eced8703@oss.qualcomm.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Sat, 29 Aug 2026 19:01:31 -0700
X-Gm-Features: AcwNN1WiAb0Q13f1dUbx3G0x5k62j7uinaHZOIU1052lWkiaCapBUbdu9a4BAPw
Message-ID: <CAGEkeHdG2KkyR3ZV8aB31Ymcsg==Qyyqf3Jbyg+XJu4CvfLjOw@mail.gmail.com>
Subject: Re: [PATCH v6] media: qcom: iris: move OPP handling to VPU power transaction
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This is an existing "issue" in the driver

Thanks for the review.

I understand that iris_opp_set_rate(0) only selects the lowest OPP
and does not actually drop the performance-state vote, which is handled
when the device runtime-suspends.

I will keep the OPP ownership change in iris_vpu_power_on() separate from
this existing behavior. Would you prefer the actual OPP release to be
addressed in a separate follow-up patch?

Thanks,
Hungyu Lin
