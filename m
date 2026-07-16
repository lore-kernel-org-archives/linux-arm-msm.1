Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082622E8897
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784242239; cv=none; b=jqH8kURCOIRc4/pFG7A4WQBXAwYkRlq5BXc0XbQlsiNtmu9k/XzZDGx5TJ340T8B0nbvLdBEl6qdgFQktzkKVqyQH43rrxL4wti0ifHmW0NOL2u9nw0TwiQ9/JnXPrQ0Iao9L31VUjjlKzd+BI6zCK7jmCpVwgmfZpNU0wCAdWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784242239; c=relaxed/simple;
	bh=G3M56D7Hw4JcKBHyy9MMshKRSmgzkT9M2iCh3vdgJp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALGyNaTwx4euiUpoUKT3NSsuZxg7ciwxmMDSBOuQxqmRPltrz7cCOWSgZHPDIt10Tjy0hKHYJe1wMuQVqqosiix5754+BcY6L29us4DHNd9MHE3LuGYgJEMsa1XOq9IgryjIVEZNASHrUE8z2eWI1/sOVn/dpk7hIRmUTT5vT/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e3abYEdx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MoAkMrWW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e3abYEdx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MoAkMrWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784242236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ObT2MLWggP0CPh3Zc10/u3DfAojIZjELn3oUv8rUGrk=;
	b=e3abYEdxdz1dKmXnUmDg/UD1JoxK0kx5IiZEgsucBzo1gRbWxL9KRarigrS3RsGYCYDI7B
	/CIcP80QdXCHcJyo5bomoeE0f8OcGqroT9GbQ2UwYRzmeiqK/NUugQO6DPvDIBGs8ULZmu
	LijLUqmYIy1JVkjcNWkXM3X5HS+ztTQ=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-EwZUUIDyOhSVFfma7_zMJw-1; Thu, 16 Jul 2026 18:50:35 -0400
X-MC-Unique: EwZUUIDyOhSVFfma7_zMJw-1
X-Mimecast-MFC-AGG-ID: EwZUUIDyOhSVFfma7_zMJw_1784242235
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48f0c5d20c6so5514020b6e.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 15:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784242234; x=1784847034; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ObT2MLWggP0CPh3Zc10/u3DfAojIZjELn3oUv8rUGrk=;
        b=MoAkMrWW/zrR7GEsNQsrhuw1AOQZH/xAvmEmhfJIVYg6NGHVqRe0GltzhX1fYohu4m
         ZydfJ6WklP394daSaVbx+8NbwIElvjeKtipY1Ph3GR8LUSzaaHQa1CrgOhFrN6SfPUIL
         0oquS1YO8BDEz+54JYednjljbXOqvhLYOy7Bs7TCFoTyq6JZwwYA18gSQvRaBwu29rnr
         Ezt1i65sQuAvupnzE9wVpt5y870rZxJ16GJ454FXoyhBor+z1Wd+T3koUY8XhG/bZe9y
         BeQuFv/WnlhXyvXPa/CgfIrm8Ip3wc5eoMvBVZ66RI4Zs1HnBKtGE+z55oWiK8+Mqasa
         E3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784242234; x=1784847034;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ObT2MLWggP0CPh3Zc10/u3DfAojIZjELn3oUv8rUGrk=;
        b=UwzLQLhv/aSJSBi6P+KPAl1rXVw7G91WjuIchjTVomWC4HRZ3GZDdpCE+fP6bqCsGj
         PHLmguqU2MNSBWuGiVWD0bhzbyfw+V47CYcjZZJ/D1yg1F2UoszZLSkuV4q4KhOnY5qN
         wVmJZb6B06LVkXMqf1Sil1KE09O6mDcWGj0W/x0l92vCE631NSTFrf6RUlEThwPQvuV1
         Cf6FYyNFhXem8a6reHmA2gXlA36dGuKFH64A1lS7IbQO+7LtZJID29a6B3OmpYChg5W8
         nkHrSQLNJrpkIXBDRLVSRM/Wk25SHrJmhkonU29QCRtLL2JIVnmiGRhLU3a3e5ETOzsf
         3i+g==
X-Forwarded-Encrypted: i=1; AHgh+Ro5Ik0AebpYH8Ngt2GEHmZsIicrUh5L2CCmDxMhNQ86qabJugV6QsiQ4jj115TRexhqGtiQwuvNvkwNTN1Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxLZg8MQQl39cF5Y985/TcY4IK+iLs+BaezdJwVRaFi23zHPfdw
	jbTEHG3INnGCzuR87DksrcZdI654hHgVwNn6vlDvYoattqP7h21lFhCofW7VJvN1d1ZtWxN8psc
	AmiGDzoISI3KkvwKfEtrjp8Va2juqmLtIymoMHA21Xg3ihBSH9eIt7eQWOBoO3bblsYc=
X-Gm-Gg: AfdE7ck9b0LV+NCYJFuu6ytn8fxm4rwjwhb3dQgbzN1DlW5pn8kvuM5ZymwMlKT9rsS
	TkIxfqXqNZwj4UtP8Y99rgHCHbcjlv9X6LXNIb2cbvxeFPgxoBKPLHw+ArqWGLxNYR8QzH+iiYB
	H6XUDIExKS4hn0k2ipSlFF4uYEpIwY9KRVNd1QVmK/KhzwS9eAim7nZwIb+RueK7x04UkzAJmP2
	kJUas1WIRR7biVNqTP1J+hIf5Z7j6xzaURHXgpQIxstmWG6tGDPvFRSxYAZz+L9A+WiikxMa5ic
	RMPF8fUaCUMd1pXg6OVmHHVWr3hkTEFy4yBK4bKHyncy4GTXh1u8kDWf1xDqtOPfWPP9XUSA7w=
	=
X-Received: by 2002:a05:6808:1241:b0:497:d87b:6dc5 with SMTP id 5614622812f47-4a4c8854f45mr1054388b6e.40.1784242234608;
        Thu, 16 Jul 2026 15:50:34 -0700 (PDT)
X-Received: by 2002:a05:6808:1241:b0:497:d87b:6dc5 with SMTP id 5614622812f47-4a4c8854f45mr1054368b6e.40.1784242234196;
        Thu, 16 Jul 2026 15:50:34 -0700 (PDT)
Received: from redhat.com ([2600:382:8501:9a15:b085:521d:bf27:780])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1b01eefbbsm18780053b6e.13.2026.07.16.15.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 15:50:32 -0700 (PDT)
Date: Thu, 16 Jul 2026 18:50:29 -0400
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
Message-ID: <allgNY_1HwlRZPB9@redhat.com>
References: <7b6441aa3b0dba35112ea486bfea3b3171d8527b.1784225976.git.ukleinek@kernel.org>
 <alkt62x8pmKE2aKi@redhat.com>
 <alk1--PeUJ7pKbvA@monoceros>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alk1--PeUJ7pKbvA@monoceros>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Jul 16, 2026 at 09:55:23PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> On Thu, Jul 16, 2026 at 03:15:55PM -0400, Brian Masney wrote:
> > On Thu, Jul 16, 2026 at 08:21:05PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > > The only used symbol in these four drivers that is provided by
> > > <linux/mod_devicetable.h> is of_device_id and this is also provided by
> > > <linux/platform_device.h>.
> > 
> > I don't see it defined in platform_device, unless I am missing
> > something?
> > 
> > It looks like the reason this compiles is because of this chain of
> > includes:
> > 
> > linux/clk-provider.h -> linux/of.h -> linux/device-id/of.h
> 
> Well, the chain for <linux/platform_device.h> is:
> 
> 	   <linux/platform_device.h>
> 	-> <linux/device.h>
> 	-> <linux/device/driver.h>
> 	-> <linux/device-id/of.h>
> 
> but the more relevant thing is: <linux/platform_device.h> makes use of
> struct of_device_id and most consumer of that header (typically platform
> drivers) need struct of_device_id. So it's very sensible that
> <linux/platform_device.h> is enough to get that definition. The include
> chain is just an implementation detail.
>  
> > > So drop the unneeded include which brings us
> > > one step closer to removing <linux/mod_devicetable.h>.
> > > 
> > > Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> > 
> > With an updated commit message:
> > 
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> Does this discussion convince you that the commit log is ok as is?

Yes, agreed. Thanks for the clarification.

Brian

