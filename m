Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17D722B8AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 19:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784229364; cv=none; b=RpbPDxBQ4TIeaIcaksnkWs3pjXJflifGz4HAokV7TwO2wEghgJHKClMFPlDmIfpfb8qto3YzwaMfSNl9wX/BGQO6NmMKwKET+v0KhnExIO+6GZmx7SJRDDTSxmYkrEmMSpCb5X4wsa99ioRt75+QF6UZEZ1B0JYlvzEkLtXvg3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784229364; c=relaxed/simple;
	bh=d5ie8U7cPhn27p+Igsr1dRGiF11f9FBY6Gx2zGXVHCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vExf1XBgBr8oPyz5LqKo45hV9wcLZA8jAnRJqbHfycQCqjgFndq+HKQuRWiDhZ7zM57iHIIG7vOTjUWY2Mlo31R70jSt9IEqib6LI69oa+UOAp6pViUpBh4IOErlIIZOnN5QazpF4cGlLE4rif3eRus/vIwqLNVuaJF3WzDHvwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TJlmWus6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IPL5kEGf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TJlmWus6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IPL5kEGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784229360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ww0rJdn3hOUipKhN03+UND2dQfBI3wYOfiNLleaoT6g=;
	b=TJlmWus6ZbfAq+yxgxjgVwJeACMqww1CEldZ1Awbl6xk/Uh3BQ/uVUChVQoFZjWYWIWdSU
	cvZQXjKchXIxL9pUktgKnPO/I4y5ZF9uugDqciITFANCwIhjpSMyQcgJFEDAIy4Ir5qoWp
	NykISGtX37mpo3SA4klDHCJrtJMdZL4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-vjEopD11OoGGJ-H0bTthjA-1; Thu, 16 Jul 2026 15:15:59 -0400
X-MC-Unique: vjEopD11OoGGJ-H0bTthjA-1
X-Mimecast-MFC-AGG-ID: vjEopD11OoGGJ-H0bTthjA_1784229359
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ef8249f871so116379706d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 12:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784229359; x=1784834159; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ww0rJdn3hOUipKhN03+UND2dQfBI3wYOfiNLleaoT6g=;
        b=IPL5kEGflFQZSwD2ySXm/inblAgD1LYs84Mx+9FKouYRSpGp6uAiRJmQ/jsk7W+j6s
         bwBOEXkBs4CPzey7ncNguVCyZyyUMFkj/2aR1Jkv/PiwWQbL1t/iVgTYJZINe1kcUwkD
         ddfutdIug03dq0HU9VuqjLwrJrRIyN0tlaNgO4NSwNJ4CzqaHghLlKhi62tGRATHrb2g
         di28qOAH46e9hb/a7SeeQRu4pFkH3l4AHAzSwIjb7Zxczq7NCT6xkR1+sFbBSoWKoKer
         JRwvme8+aRu3FFaN4/XKR7cQ7Tk/gq1NbYIhuPda9LGPc9d13z/HQ8TuaI2VEKRNwXE0
         PyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784229359; x=1784834159;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ww0rJdn3hOUipKhN03+UND2dQfBI3wYOfiNLleaoT6g=;
        b=ADFL0HPKtoqzhOXoHKyBhHr8aCjIqQg2yM1bBzTOTCWcfLlp+hBvzEkn1laE5u17Ce
         pevxrv22zlFb2a06UHvb9u6JOHnwxTXsIFq7KJCQFg2JuvH2OX++wS40RvjX3LtK75Wh
         yQcV0lfONJJQRdf8yWAQGip9tbShs58sDMYFTK9cvkXbDIDRR1cHU15YPwqILzayUGOe
         NFoQKGRHRGTzmWFkVsz1Ah4ckG7rV4JXKBDE9e9LKdzyF8KFagAzgOf4JT1fRN/3Flrr
         BkyBuIXn1uVnwE578qlCz1vtzsz3XMtShbkPl+4cn7Zo5wzYvIraGHGOdumiCuxB+N9C
         PNVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcOOsyYoicPhQGe9fujOly2dnauuz0QQ5yeh99c7yEBpCiMcv3/gaF60hjBRpEtvqn/QMX1OcXtZjQeGnD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+HFyay4GliJmsipPA3wQroW3KQUAdUTvOFQnZJqVCjOmBa7Ws
	WSKv0I+oJi1canB3t39FfGIhvW9TUSkc56Zx4i46YlCr+VYduoTIr/Do7sYoMIqJjk/+WAQpQjL
	xD5gUmnZ/SP3zrDcT1sPTIfNFl9rq1NoklQmP7N31UmqhMBG/JOPAHU9rPtf8LDLKE9c=
X-Gm-Gg: AfdE7ck/ZyFbNWP3L6ApO5j014kaPm53YbVRXJqh0GXKM/iqmTAoF+iqussxEGJUZP3
	E2PQQIr6idTRtAnwf5uDwIa9cR/ia3+8PZQfAvHNUzmmTpDlukoOXzUD8hRdwemLgpCm+KA35L6
	z3I9DVK5XQewP6OljWGOR7UkuMDlb4Fwnc6DYxCdub9swyzBg7O/RFwT0K7PZaVSpY8TwACBy+0
	wXNNFiguxfHeDz+1UC+wVYIHyC9P69LHXt4t9rNgIBdoBvxUWZXgiz8EWuXfExOC7kPJWZd5J0Z
	AHCerUkAKNUkZYZFPCheyQYmotkkU1/H1kJ5G8XoQ3WsESevBnkTJcW/spWDoR+dPXfsdANcZY/
	gz+995y2Jw95n3QD0pXcZEWJOLyAUglFMVYw=
X-Received: by 2002:a05:6214:20eb:b0:8ce:e651:5d63 with SMTP id 6a1803df08f44-90758de2fc2mr99117126d6.31.1784229358945;
        Thu, 16 Jul 2026 12:15:58 -0700 (PDT)
X-Received: by 2002:a05:6214:20eb:b0:8ce:e651:5d63 with SMTP id 6a1803df08f44-90758de2fc2mr99116606d6.31.1784229358362;
        Thu, 16 Jul 2026 12:15:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-904116650b7sm204511816d6.8.2026.07.16.12.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 12:15:57 -0700 (PDT)
Date: Thu, 16 Jul 2026 15:15:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: qcom: Drop inclusions of
 <linux/mod_devicetable.h>
Message-ID: <alkt62x8pmKE2aKi@redhat.com>
References: <7b6441aa3b0dba35112ea486bfea3b3171d8527b.1784225976.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b6441aa3b0dba35112ea486bfea3b3171d8527b.1784225976.git.ukleinek@kernel.org>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Jul 16, 2026 at 08:21:05PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The only used symbol in these four drivers that is provided by
> <linux/mod_devicetable.h> is of_device_id and this is also provided by
> <linux/platform_device.h>.

I don't see it defined in platform_device, unless I am missing
something?

It looks like the reason this compiles is because of this chain of
includes:

linux/clk-provider.h -> linux/of.h -> linux/device-id/of.h


> So drop the unneeded include which brings us
> one step closer to removing <linux/mod_devicetable.h>.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

With an updated commit message:

Reviewed-by: Brian Masney <bmasney@redhat.com>

